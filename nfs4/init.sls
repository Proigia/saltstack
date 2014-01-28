nfs-common:
  pkg:
    - installed
  service:
    {% if grains['os'] == 'Ubuntu' %}
    - name: rpc.idmapd
    {% endif %}
    - running
    - watch:
      - file: /etc/idmapd.conf
      - file: /etc/default/nfs-common

/etc/idmapd.conf:
  file:
    - managed
    - source: salt://nfs4/idmapd.conf
    - template: jinja
    - user: root
    - context: {
        domain: proigia.nl }
    - group: root
    - mode: 644
    - require:
      - pkg: nfs-common

/etc/default/nfs-common:
  file:
    - managed
    - source: salt://nfs4/nfs-common
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: nfs-common
