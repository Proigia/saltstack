base:
  pkgrepo.managed:
    - humanname: java_webupd8team
    - comments:
        - 'Managed by saltstack'
    {% if grains['os'] == 'Debian' %}
    - name: deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main
    {% else %}
    - name: deb http://ppa.launchpad.net/webupd8team/java/ubuntu {{ grains['oscodename'] }} main
    {% endif %}
    - file: /etc/apt/sources.list.d/webupd8team.list
    - keyid: EEA14886
    - keyserver: pgp.mit.edu
    - require_in:
      - pkg: oracle-jdk7-installer
      - pkg: oracle-java7-set-default
    - require:
      - pkg: python-apt

python-apt:
  pkg:
    - installed

java7-oracle-license-present:
  debconf.set:
    - name: oracle-licence-present
    - data:
        'shared/present-oracle-license-v1-1':  { 'type': 'boolean', 'value': 'true' }

java7-oracle-license-accepted:
  debconf.set:
    - name: oracle-licence-accepted
    - data:
        'shared/accepted-oracle-license-v1-1':  { 'type': 'boolean', 'value': 'true' }

oracle-jdk7-installer:
  pkg:
    - installed
    - require:
      - debconf: oracle-licence-present
      - debconf: oracle-licence-accepted

oracle-java7-set-default:
  pkg.installed

debconf:
  pkg.installed

