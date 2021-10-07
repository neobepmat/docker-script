# LDAP configuration for GITLAB

The file to modify is
> /etc/gitlab/config/gitlab.rb

this file is mapped on the persistent volume mounted on folder /dock

```
gitlab_rails['ldap_servers'] = YAML.load <<-'EOS'
   main: # 'main' is the GitLab 'provider ID' of this LDAP server
     label: 'LDAP'
     host: 'bonyfish.cla.cl-grp.local'
     port: 389
     uid: 'sAMAccountName'
     bind_dn: 'cla\administrator'
     password: '@compline29121g535'
     encryption: 'plain' # "start_tls" or "simple_tls" or "plain"
     verify_certificates: false
     smartcard_auth: false
     active_directory: true
     allow_username_or_email_login: false
     lowercase_usernames: true
     block_auto_created_users: false
     base: 'OU=Users,OU=CLA,DC=cla,DC=cl-grp,DC=local'
     user_filter: ''
     ## EE only
     group_base: ''
     admin_group: ''
     sync_ssh_keys: false
```
