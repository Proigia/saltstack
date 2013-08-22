include:
  - nfs4.init

nfs_server:
  require:
    - pkg: nfs-kernel-server
    - pkg: portmap
    - pkg: nfs-common

/etc/exports:
  file:
    - managed
    - source: salt://nfs_server/exports
    - user: root
    - group: root
    - mode: 644

nfs-kernel-server:
  pkg:
    - installed
  service:
    - running
    - watch:
      - file: /etc/exports
