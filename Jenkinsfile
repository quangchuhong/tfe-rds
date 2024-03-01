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

        stage('git clone and terraform init and plan') {
            steps {
                sh '''#!/usr/bin/env bash
                echo "Shell Process ID: $$"
                git config --global user.email "quang.hong.0991@gmail.com"
                git config --global user.name "quangchuhong"
                git clone https://$GIT_CREDS_USR:$GIT_CREDS_PSW@github.com/quangchuhong/tfe-rds.git
                chmod 400 "keypair-quangch.pem"
                ssh -i "keypair-quangch.pem" ubuntu@ec2-18-143-107-83.ap-southeast-1.compute.amazonaws.com
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