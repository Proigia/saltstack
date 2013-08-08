vim:
  pkg.installed

/usr/share/vim/vimcurrent/plugin/gnupg.vim:
  file.managed:
    - source: salt://vim/gnupg.vim
    - mode: 644
    - user: root
    - group: root
