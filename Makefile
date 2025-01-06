ifeq ($(DESTDIR),)
    DESTDIR := /
endif

install:
	mkdir -p $(DESTDIR)opt/
	cp -R src/opt/thefanclub $(DESTDIR)opt/
	mkdir -p $(DESTDIR)usr/share/applications/
	cp    src/usr/share/applications/grive.desktop $(DESTDIR)usr/share/applications/
	cp    src/usr/share/applications/grive-setup.desktop  $(DESTDIR)usr/share/applications/
	cp    src/usr/share/applications/grive-indicator.desktop  $(DESTDIR)usr/share/applications/
	mkdir -p $(DESTDIR)usr/share/doc/
	cp -R src/usr/share/doc/grive-tools $(DESTDIR)usr/share/doc/
	mkdir -p $(DESTDIR)usr/share/glib-2.0/
	mkdir -p $(DESTDIR)usr/share/glib-2.0/schemas/
	cp    src/usr/share/glib-2.0/schemas/apps.grive-indicator.gschema.xml $(DESTDIR)usr/share/glib-2.0/schemas/
	mkdir -p $(DESTDIR)usr/share/locale

uninstall:
	rm -R $(DESTDIR)opt/thefanclub
	rm    $(DESTDIR)usr/share/applications/grive.desktop
	rm    $(DESTDIR)usr/share/applications/grive-setup.desktop
	rm    $(DESTDIR)usr/share/applications/grive-indicator.desktop
	rm -R $(DESTDIR)usr/share/doc/grive-tools
	rm    $(DESTDIR)usr/share/glib-2.0/schemas/apps.grive-indicator.gschema.xml
	find . -wholename $(DESTDIR)usr/share/locale/**/grive-indicator.mo -type f -delete
	find . -wholename $(DESTDIR)usr/share/locale/**/grive-setup.mo -type f -delete
