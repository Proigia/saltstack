openssh-server:
  pkg:
    - latest
  service:
    - running
    - name: sshd

openssh-client:
  pkg:
    - latest
