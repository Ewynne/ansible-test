pipeline {
  agent any
  stages {
    stage('Checkout SCM') {
      steps {
        checkout scm
      }
    }
    
    stage('Playbook') {
      agent {
       dockerfile true
      }
      steps {
        sh 'pip install pipenv'
        sh 'eval "$(pipenv --completion)"'
        sh 'pipenv --python 3.6.5'
        sh 'pipenv install --dev'
        sh 'pipenv install ansible'
        
        sh 'echo "all:" > hostsfile.yml'
        sh 'echo "  children:" >> hostsfile.yml'
        sh 'echo "    linxservers:" >> hostsfile.yml'
        sh 'echo "      hosts:" >> hostsfile.yml'
        sh 'echo "        ec2-34-235-151-142.compute-1.amazonaws.com:" >> hostsfile.yml'
        
        withCredentials([file(credentialsId: '61092b45-60ab-4d96-92d3-4f2e169d5e69', variable: 'VAULT_TOKEN'), sshUserPrivateKey(credentialsId: '6f87b671-e5a8-48dc-a045-a6b21b01400f', keyFileVariable: 'SSH_PASSWORD')]) {
            sh "ls -al"
            sh 'pipenv run ansible -vv -m ping ec2-34-235-151-142.compute-1.amazonaws.com -i hostsfile.yml --vault-password-file ${VAULT_TOKEN} --private-key "${SSH_PASSWORD}"'
        }  
      }
    }
  }   
}


