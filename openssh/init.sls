openssh-server:
  pkg:
    - latest

sshd:
  service.running:
    - enabled: True
    - require:
        - pkg.latest: openssh-server

openssh-client:
  pkg:
    - latest
