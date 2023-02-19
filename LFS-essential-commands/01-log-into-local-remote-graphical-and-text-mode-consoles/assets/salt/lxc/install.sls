# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import lxc with context %}

{% set repoState = 'removed' %}
{% if lxc.enabled %}
  {% set repoState = 'installed' %}
{% endif %}


lxc-packages:
  pkg.{{ repoState }}:
    - skip_suggestions: True
    - refresh: True
    - allow_updates: True
    - pkgs:
      - lxc