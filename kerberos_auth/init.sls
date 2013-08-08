kerberos_auth:
  require:
    - pkg: krb5-user
    - pkg: krb5-config
    - pkg: libpam-krb5

krb5-user:
  pkg:
    - installed

krb5-config:
  pkg:
    - installed

  debconf.set:
    - name: krb5-config
    - data:
        'krb5-config/add_servers_realm': { 'type': 'string', 'value': 'PROIGIA.NL' }
        'krb5-config/default_realm': { 'type': 'string', 'value': 'PROIGIA.NL' }

/etc/krb5.conf:
  file:
    - managed
    - source: salt://kerberos_auth/krb5.conf
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: krb5-config
      - pkg: krb5-user

libpam-krb5:
  pkg:
    - installed

/etc/pam.d/common-password:
  file:
    - comment
    - regex: '^password.*pam_krb5.*uid.*$'
  require:
    - pkg: libpam-krb5
