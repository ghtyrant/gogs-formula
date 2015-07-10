git:
  user.present

/home/git/gogs:
  archive.extracted:
    - source: salt://gogs/files/linux_amd64.zip
    - archive_format: zip
  file.directory:
    - user: git
    - group: git
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - user
      - group
      - mode

/home/git/gogs/gogs:
  file.managed:
    - mode: 755

/home/git/gogs/log:
  file.directory:
    - mode: 755
    - user: git
    - group: git

/etc/rc.d/init.d/gogs:
  file.copy:
    - source: /home/git/gogs/scripts/init/centos/gogs
    - mode: 755
