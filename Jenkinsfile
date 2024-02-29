pipeline {
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
                terraform init
                terraform plan
                '''
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
}