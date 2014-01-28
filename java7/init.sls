base:
  pkgrepo.managed:
    - humanname: java_webupd8team
    - comments:
        - 'Managed by saltstack'
    - name: deb http://ppa.launchpad.net/webupd8team/java/ubuntu {{ grains['oscodename'] }} main
    - file: /etc/apt/sources.list.d/webupd8team.list
    - keyid: EEA14886
    - keyserver: pgp.mit.edu
    - require_in:
      - pkg: oracle-jdk7-installer
      - pkg: oracle-java7-set-default

java7-debconf:
  debconf.set:
    - name: 'oracle-licence-accepted'
    - data:
        'shared/accepted-oracle-license-v1-1':  { 'type': 'selected', 'value': True }

oracle-jdk7-installer:
  pkg.installed

oracle-java7-set-default:
  pkg.installed
