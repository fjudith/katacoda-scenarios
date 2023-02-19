# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import lxc with context %}

{% set home_dir = '/home/{{ lxc.config.user }}' %}
{% if lxc.config.user | lower in ('root',) %}
  {% set home_dir = '/home/root' %}
{% endif %}

/etc/lxc/lxc-usernet:
  file.managed:
    - source: salt://{{ tpldir }}/templates/lxc-usernet.j2
    - user: {{ lxc.config.user }}
    - group: {{ lxc.config.group }}
    - mode: "0644"
    - template: jinja
    # - watch_in:
    #   - service: envoy.service
    - context:
        tpldir: {{ tpldir }}

{{ home_dir }}/.config/lxc:
  file.directory:
    - user: {{ lxc.config.user }}
    - group: {{ lxc.config.group }}
    - dir_mode: "0700"
    - makedirs: True


{{ home_dir }}/.config/lxc/default.conf:
  file.managed:
    - require:
        - file: {{ home_dir }}}/.config/lxc
    - source: salt://{{ tpldir }}/templates/default.conf.j2
    - user: {{ lxc.config.user }}
    - group: {{ lxc.config.group }}
    - mode: "0644"
    - template: jinja
    # - watch_in:
    #   - service: envoy.service
    - context:
        tpldir: {{ tpldir }}

lxc-envvar:
  environ.setenv:
    - name: DOWNLOAD_KEYSERVER
    - value: hkp://keyserver.ubuntu.com
    - update_minion: true

lxc-container-a:
  module.run:
    - lxd.container_create:
      - name: hosta
      - source: focal/amd64