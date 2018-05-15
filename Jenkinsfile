node {
    ansiblePlaybook(
        inventory: 'hosts.yml',
        playbook: 'linux_playbook.yml',
        extraVars: [
            vault-password-file: ./vault_password_file
        ])
}
