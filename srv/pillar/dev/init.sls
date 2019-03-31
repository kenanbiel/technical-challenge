mysql:
  server:
    root_user: 'root'
    root_password: 'password'
    root_password_hash: '*2470C0C06DEE42FD1618BB99005ADCA2EC9D1E19'
    user: mysql
    host: localhost

  user:
    drupaluser:
      password: 'drupalpassword'
      host: 'localhost'
      databases:
        - database: drupaldatabase
          grants: ['all privileges']
  
  database:
    - name: drupaldatabase
      character_set: utf8
      collate: utf8_general_ci

drupal:
  lookup:
    name: drupalsite
    ip: '*'
    port: 80
    user: 'drupaladmin'
    group: 'www-data'
    home: /var/www
    version: '8.6.13'
    source_hash: 'md5=46e99775c47253571286f0c81a222f63'
    fix_permissions: True
