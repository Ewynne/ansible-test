pipeline {
  agent {
      docker {
          image 'python:3.6'
          label 'docker'
      }
  }
  stages {
    stage('Checkout SCM') {
      steps {
        checkout scm
      }
    }

    stage('Playbook') {
      steps {
        sh 'pip install pipenv'
        sh 'eval "$(pipenv --completion)"'
        sh 'pipenv --python 3.6.5'
        sh 'pipenv install --dev'
        sh 'pipenv install ansible'
        
        withCredentials([file(credentialsId: '61092b45-60ab-4d96-92d3-4f2e169d5e69', variable: 'VAULT_TOKEN')]) {
            sh 'pipenv run ansible-playbook -vv -s linux_plabook.yml -i hosts.yml --vault-password-file ${VAULT_TOKEN}'
        }  
      }
    }
  }   
}


