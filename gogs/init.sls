git:
  user.present

/etc/rc.d/init.d/gogs:
  file.managed:
    - source: salt://gogs/files/init
    - mode: 755
