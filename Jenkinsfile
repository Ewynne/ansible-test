node {
    withCredentials([file(credentialsId: 'ansible-vault', variable: 'VAULT_TOKEN')]) {
        ansiblePlaybook colorized: true, credentialsId: '', inventory: 'hosts.yml', limit: '', playbook: 'limux_playbook.yml', sudoUser: null, extras: "--vault-password-file ${VAULT_TOKEN}"
    }
}

