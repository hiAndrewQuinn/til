---
title: I still like Jenkins
date: 2026-05-09
tags: 
- against-entropy
- builds
- cicd
- configuration-as-code
- devops
- automation
- jenkins
---


Before [GitHub Actions](https://github.com/features/actions),
before [GitLab CI/CD](https://docs.gitlab.com/ee/ci/),
and before the panoply of startups all promising
to help you build your software faster and with
less hassle, there was the humble,
open source
[Jenkins](https://www.jenkins.io/).
Or perhaps I should say is: Jenkins is still actively
maintained to this day, and has actually been in use
in basically every single place I have worked since
graduating from high school, although not everyone
who was using it was exactly happy with it.

But *I* like Jenkins a great deal. Probably due to it
being open source, and having an embedded sandboxed
implementation of
[something kind of 2:1-ways between Java and Python](https://groovy-lang.org/),[^groovy]
I am aware of no CI/CD system out there that truly
gets you as much flexibility as Jenkins does.

But - and I think this is key - Jenkins is *complex*,
at least as complex as the actual build jobs you are
trying to orchestrate. You are very well served by just
racking up hours in the cockpit with any CI/CD system,
as they all come with warts. Unlike most commercial
offerings, the only thing Jenkins will force you to pay
for is the electricity or perhaps rental costs of the 
VMs you run it on. At least for me, this rock bottom
price means I'm a lot more willing to get weird and
experimental with it.

Where would I recommend someone who has never used Jenkins
before get started? 
The official
[Docker container](https://hub.docker.com/r/jenkins/jenkins/)
is surprisingly easy to get set up.
The only thing I emphasize is to use
[Multibranch Pipelines](https://www.jenkins.io/doc/book/pipeline/multibranch/)
from the start. Accept no imitations!
Multibranch Pipelines mean that
*every* Git branch, every Pull Request, etc., gets a separate
ephemeral build job, and these will be disabled or deleted
as the PRs complete or the branches disappear from remote.

From there it's mostly a game of figuring out what you
actually want your various repositories to do. Start by
taking a handful of jobs and creating
[`Jenkinsfile`](https://www.jenkins.io/doc/book/pipeline/jenkinsfile/) files in them. This is what the Multibranch
Pipeline needs to be present on a branch to know it actually
is supposed to build that branch. The
[Declarative Pipeline](https://www.jenkins.io/doc/book/pipeline/syntax/#declarative-pipeline)
syntax is pretty straightforward to read, and looks like
so:

```groovy
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'npm install'
                sh 'npm run build'
            }
        }
        stage('Test') {
            steps {
                sh 'npm test'
            }
        }
        stage('Deploy') {
            // Only run the deploy stage if we are on the main branch
            when { branch 'main' }
            steps {
                echo 'Deploying to production...'
                // sh './deploy.sh'
            }
        }
    }
}
```

Once you get to the point where you're starting to copy and
paste the same Jenkinsfile, or the same file with only minor
variations, it's time to factor it out into a
[Jenkins Shared Library](https://www.jenkins.io/doc/book/pipeline/shared-libraries/),
so that instead you can just use

```groovy
@Library('pipelines@v0.0.1')  // pull Git commit tagged 'v0.0.1'

standardNpmPipeline()
```

Jenkins' sophistication kind of has, like, stages of
enlightenment to it,[^enlightenment] and by the time you are moving your
own pipelines into a centralized versioned repo you're
starting to get up there in rank. But you can go so much
farther. For example, if you don't want to bother actually
manually creating those Multibranch Pipeline jobs, you
can use the 
[Job DSL plugin](https://plugins.jenkins.io/job-dsl/)
to, for example, scrape *every* repo you have on W.L.O.G.[^wlog]
GitHub, like so:

```groovy
organizationFolder('my-company-github-org') {
    description('Automatically discovers all repositories in our GitHub organization and builds them.')
    displayBuilds(5)

    organizations {
        github {
            repoOwner('my-awesome-startup') 
            credentialsId('github-service-account-token')
            traits {
                gitHubBranchDiscovery {
                    strategyId(1) 
                }
                
                gitHubPullRequestDiscovery {
                    strategyId(1) 
                }
            }
        }
    }

    projectFactories {
        workflowMultiBranchProjectFactory {
            scriptPath('Jenkinsfile')
        }
    }

    orphanedItemStrategy {
        discardOldItems {
            numToKeep(10)
        }
    }

    triggers {
        periodicFolderTrigger {
            interval('1d')
        }
    }
}
```

And then from there, if even the mere act of providing a Jenkinsfile
bums you out, you can again use the Job DSL plugin (this time in concert with the
[Remote Jenkinsfile Provider plugin](https://plugins.jenkins.io/remote-file/))
to define a default Jenkinsfile that every repo without its own Jenkinsfile
falls back to:

```groovy
// Requires the Remote Jenkinsfile Provider plugin.
// Factories are evaluated in order; the first one whose marker matches wins.
projectFactories {
    // First: if the branch has its own Jenkinsfile, use it.
    workflowMultiBranchProjectFactory {
        scriptPath('Jenkinsfile')
    }

    // Otherwise: fall back to a centralized default for any repo
    // that looks like a Node project (i.e. has a package.json).
    remoteJenkinsfileProjectFactory {
        localMarker('package.json')

        remoteJenkinsfile('pipelines/default-npm-pipeline.groovy')

        remoteJenkinsfileSCM {
            git {
                remote {
                    url('https://github.com/my-awesome-startup/jenkins-infrastructure.git')
                }
                credentials('github-service-account-token')
                branches('main')
            }
        }
    }
}
```

As always, assume I have gotten one thing subtly and intentionally wrong with these code snippets for pedagogical purposes. Totally not that I was too lazy on a Saturday to pull down a Jenkins Docker image at home and stress test them myself. Regardless I do hope that I have given you some idea of the level of *control* Jenkins offers, the thrill of automating the automations that can at its best only be matched by a game like *[Factorio](https://www.factorio.com/)*.[^factorio] I have always liked software that rewards the player for their time investment, and Jenkins is up there with the best of them in that department.

--
[^groovy]: I mean this affectionately. Groovy will let you write code that *looks* like Java but with the breezy dynamic typing and closure-fu of Python; it will also let you write code that does neither side any favors. Inside a Jenkins pipeline you also have to contend with the [CPS transformation](https://www.jenkins.io/doc/book/pipeline/cps-method-mismatches/), which serializes your script's continuation so a build can survive a controller restart - elegant in concept, occasionally cursed in practice.

[^enlightenment]: Roughly: (1) clicking buttons in the web UI; (2) writing a Jenkinsfile; (3) factoring shared steps into a Shared Library; (4) generating jobs themselves with Job DSL; (5) achieving Jenkinsfile-less nirvana via Remote Jenkinsfile Provider. There is presumably a sixth stage where you give up and just write your own Kubernetes operator, but I have not personally reached it.

[^wlog]: Without loss of generality.

[^factorio]: The factory must grow. So must the Jenkins controller's heap.
