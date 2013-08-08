mk_homedir:
  require:
      - pkg: libpam-modules

libpam-modules:
  pkg:
    - installed

/usr/share/pam-configs/my_mkhomedir:
  file:
    - managed
    - source: salt://mk_homedir/my_mkhomedir
    - user: root
    - group: root
    - mode: 640
    - require:
      - pkg: libpam-modules
  cmd.wait:
    - name: pam-auth-update --package
    - watch:
      - file: /usr/share/pam-configs/my_mkhomedir

