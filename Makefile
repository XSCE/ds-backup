# install targets

install-client:
	install -D -d $(DESTDIR)/usr/bin
	install -D client/ds-backup.py $(DESTDIR)/usr/bin/
	install -D client/ds-backup.sh $(DESTDIR)/usr/bin/
	install -D -d $(DESTDIR)/etc
	install -D -m 644 client/cron-ds-backup.conf $(DESTDIR)/etc/cron.d/ds-backup

install-server:
	install -D -d $(DESTDIR)/usr/bin
	install -D server/ds-postprocess.py $(DESTDIR)/usr/bin
	install -D server/ds-cleanup.sh $(DESTDIR)/usr/bin
	install -D server/ds-cleanup.py $(DESTDIR)/usr/bin
	install -D -d $(DESTDIR)/var/www/ds-backup
	install -D server/backup-available.py $(DESTDIR)/var/www/ds-backup
	install -D -m 644 server/incron-ds-backup.conf  $(DESTDIR)/etc/incron.d/ds-backup.conf
	install -D -m 644 server/cron-ds-backup-server.conf  $(DESTDIR)/etc/cron.d/ds-backup-server.conf
	install -D -m 644 server/apache-ds-backup.conf  $(DESTDIR)/etc/httpd/conf.d/050-ds-backup.conf
	install -D -d $(DESTDIR)/var/lib/ds-backup
	# ownerships are set in the spec file - this execs as nonroot in rpmbuild
	install -D -d $(DESTDIR)/var/lib/ds-backup/recentclients
	# todo: tighten to group ownership
	install -D -d -m 777 $(DESTDIR)/var/lib/ds-backup/completion


 
