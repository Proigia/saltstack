autofs:
  pkg:
    - installed
  service:
    - running
    - watch:
      - file: /etc/auto.master
      - file: /etc/auto.home

/etc/auto.master:
  file:
    - managed
    - source: salt://autofs/auto.master
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: autofs

/etc/auto.home:
  file:
    - managed
    - source: salt://autofs/auto.home
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: autofs
