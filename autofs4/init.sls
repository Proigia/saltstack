include:
  - nfs4.init

autofs:
  pkg:
    - installed
  service:
    - running
    - watch:
      - file: /etc/auto.master
      - file: /etc/auto.net4

/etc/auto.master:
  file:
    - managed
    - source: salt://autofs4/auto.master
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: autofs

/etc/auto.net4:
  file:
    - managed
    - source: salt://autofs4/auto.net4
    - user: root
    - group: root
    - mode: 755
    - require:
      - pkg: autofs
