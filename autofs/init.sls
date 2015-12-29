autofs:
  pkg:
    - installed
  service:
    - running
    - watch:
{%- for file in ['master', 'home'] %}
      - file: /etc/auto.{{ file }}
      
/etc/auto.{{ file }}:
  file:
    - managed
    - source: salt://autofs/auto.{{ file }}
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: autofs
{% endfor %}
