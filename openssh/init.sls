openssh-server:
  pkg:
    - latest
  service:
    - running
    - name: ssh

openssh-client:
  pkg:
    - latest
