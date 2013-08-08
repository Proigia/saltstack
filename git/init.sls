git:
  pkg.installed

/etc/sudoers.d/git:
  file.managed:
    - source: salt://git/git.sudoers
    - mode: 0440
    - user: root
    - group: root
