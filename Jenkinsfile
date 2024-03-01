pipeline {
  options {
    timestamps()
    timeout(time: 180, unit: 'MINUTES')
    // ansiColor('xterm')
    // disableConcurrentBuilds()
    // buildDiscarder(logRotator(numToKeepStr: '250', daysToKeepStr: '5'))
  }
    agent any

    environment {
        GIT_CREDS  = credentials('git')
    }
    stages {

        stage('Git Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/quangchuhong/tfe-rds.git'
            }
        }

        stage('git clone and terraform init and plan') {
            steps {
                sh '''#!/usr/bin/env bash
                echo "Shell Process ID: $$"
                terraform init
                terraform plan
                '''
            }
        }

        stage('terraform apply') {
            steps {
                input message:'Approve deployment?'
                sh '''#!/usr/bin/env bash
                terraform apply --auto-approve
                '''
            }
        }
    }

    post {
        failure {
            sh '''#!/usr/bin/env bash
            echo "Shell Process ID: $$"
            '''
            }
        }

}