ifeq ($(DESTDIR),)
    DESTDIR := /
endif

install:
	mkdir -p $(DESTDIR)opt/
	cp -R files/opt/thefanclub $(DESTDIR)opt/
	mkdir -p $(DESTDIR)usr/share/applications/
	cp    files/usr/share/applications/grive.desktop $(DESTDIR)usr/share/applications/
	cp    files/usr/share/applications/grive-setup.desktop  $(DESTDIR)usr/share/applications/
	cp    files/usr/share/applications/grive-indicator.desktop  $(DESTDIR)usr/share/applications/
	mkdir -p $(DESTDIR)usr/share/doc/
	cp -R files/usr/share/doc/grive-tools $(DESTDIR)usr/share/doc/
	mkdir -p $(DESTDIR)usr/share/glib-2.0/schemas/
	cp    files/usr/share/glib-2.0/schemas/apps.grive-indicator.gschema.xml $(DESTDIR)usr/share/glib-2.0/schemas/
	mkdir -p $(DESTDIR)usr/share/locale
	cp -R files/usr/share/locale/* $(DESTDIR)usr/share/locale

uninstall:
	rm -R $(DESTDIR)opt/thefanclub
	rm    $(DESTDIR)usr/share/applications/grive.desktop
	rm    $(DESTDIR)usr/share/applications/grive-setup.desktop
	rm    $(DESTDIR)usr/share/applications/grive-indicator.desktop
	rm -R $(DESTDIR)usr/share/doc/grive-tools
	rm    $(DESTDIR)usr/share/glib-2.0/schemas/apps.grive-indicator.gschema.xml
	find . -wholename $(DESTDIR)usr/share/locale/**/grive-indicator.mo -type f -delete
	find . -wholename $(DESTDIR)usr/share/locale/**/grive-setup.mo -type f -delete

debian:
	checkinstall \
      --type=debian \
      --maintainer='AmonRaNet \<amonra@ngs.ru\>' \
      --nodoc \
      --pkgname=grive-tools \
      --pkgversion=1.15 \
      --arch=all \
      --default \
      --pakdir=. \
      --instal=no \
      --backup=no \
      --deldesc=yes \
      --replaces=grive-tools \
      --requires='dconf-gsettings-backend \| gsettings-backend, libnotify-bin, python, python-pyinotify, zenity, expect, grive \(\>= 0.3\), libappindicator1, libappindicator3-1, gir1.2-appindicator3-0.1'
