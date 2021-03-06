# -*- coding: utf-8 -*-
# vim: ft=sls

    {%- if grains.os_family == 'MacOS' %}

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import phpstorm with context %}

phpstorm-macos-app-clean-files:
  file.absent:
    - names:
      - {{ phpstorm.dir.tmp }}
                  {%- if grains.os == 'MacOS' %}
      - {{ phpstorm.dir.path }}/{{ phpstorm.pkg.name }}*{{ phpstorm.edition }}*.app
                  {%- else %}
      - {{ phpstorm.dir.path }}
                  {%- endif %}

    {%- else %}

phpstorm-macos-app-clean-unavailable:
  test.show_notification:
    - text: |
        The phpstorm macpackage is only available on MacOS

    {%- endif %}
