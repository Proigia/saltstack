base:
  '*':
    - vim
  'roles:development':
    - match: grain
    - git
  'roles:test':
    - match: grain
    - ldap_auth
    - autofs
    - nfs4
    - mk_homedir
  'roles:workstation':
    - match: grain
    - git
    - ldap_auth
    - autofs4
    - nfs4
    - mk_homedir
    - nfs_server
  'roles:laptop':
    - match: grain
    - sssd_auth
