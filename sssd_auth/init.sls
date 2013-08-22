sssd_auth:
  require:
      - pkg: sssd
      - pkg: sssd-tools
      - pkg: libnss-sss
      - pkg: libpam-sss

sssd-tools:
  pkg:
    - installed

libnss-sss:
  pkg:
    - installed

libpam-sss:
  pkg:
    - installed

sssd:
  pkg:
    - installed
  service:
    - running
    - file: /etc/sssd/sssd.conf

/etc/sssd/sssd.conf:
  file:
    - managed
    - source: salt://sssd_auth/sssd.conf
    - user: root
    - group: root
    - mode: 600
    - require:
      - pkg: sssd
