openssh-server:
  pkg:
    - latest

ssh:
  service.running:
    - enabled: True
    - require:
        - pkg.latest: openssh-server

openssh-client:
  pkg:
    - latest
