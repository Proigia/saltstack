ldap_auth:
  require:
      - pkg: debconf-utils
      - pkg: libpam-ldapd
      - pkg: libnss-ldapd
      - pkg: nslcd

libpam-ldapd:
  pkg:
    - installed

libnss-ldapd:
  pkg:
    - installed

  debconf.set:
    - name: libnss-ldapd
    - data:
        'libnss-ldapd/clean_nsswitch': { 'type': 'boolean', 'value': 'false' }
        'libnss-ldapd/nsswitch': { 'type': 'multiselect', 'value': 'group, passwd, shadow'}

nslcd:
  pkg:
    - installed

  debconf.set:
    - name: nslcd
    - data:
        'nslcd/ldap-starttls': { 'type': 'boolean', 'value': 'false' }
        'nslcd/ldap-base': { 'type': 'string', 'value': 'dc=proigia,dc=nl' }
        'nslcd/ldap-uris': { 'type': 'string', 'value': 'ldap://kantoor.proigia.nl' }
        'nslcd/ldap-binddn': { 'type': 'string', 'value': '' }
  service:
    - running
    - watch:
      - file: /etc/nslcd.conf


/etc/nslcd.conf:
  file:
    - managed
    - source: salt://ldap_auth/nslcd.conf
    - user: root
    - group: root
    - mode: 640
    - require:
      - pkg: nslcd

