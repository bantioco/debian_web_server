#!/bin/bash

echo " "
echo -n "Choisir la distribution debian ? [ 7, 8, 9 ] :"

read choice

if [ "$choice" = "7" ]; then

	echo " "
	echo "#############################################"
	echo "#### DEBIAN 7 -- Web server installation ####"
	echo "#############################################"
	echo " "

	date

	sleep 2

	echo " "
	echo "##################################"
	echo "#### Mise à jour du sytème... ####"
	echo "##################################"
	echo " "

	sleep 2

	apt-get update && apt-get upgrade

	echo " "
	echo "################################"
	echo "#### Installation net-tools ####"
	echo "################################"
	echo " "

	sleep 2

	apt-get install net-tools

	ifconfig

	echo " "
	echo "#############################"
	echo "#### Installation Apache ####"
	echo "#############################"
	echo " "

	sleep 2

	apt-get -y --force-yes install apache2
	netstat -tanpu |grep :80
	ls /var/log/apache2/


	echo " "
	echo "#############################"
	echo "#### Installation PHP5 ####"
	echo "#############################"
	echo " "

	sleep 2

	apt-get -y --force-yes install php5 libapache2-mod-php5

	/etc/init.d/apache2 restart

	apt-cache search php5

	apt-get -y --force-yes install php5-mysql php5-curl php5-gd php5-intl php-pear php5-imagick php5-imap php5-mcrypt php5-memcache php5-ming php5-ps php5-pspell php5-recode php5-snmp php5-sqlite php5-tidy php5-xmlrpc php5-xsl
	
	/etc/init.d/apache2 restart

	apt-get -y --force-yes install php-apc

	/etc/init.d/apache2 restart


	echo " "
	echo "######################################"
	echo "#### Création du fichier info.php ####"
	echo "######################################"
	echo " "

	sleep 2

	touch /var/www/html/info.php

	echo "<?php phpinfo(); ?>" >> /var/www/html/info.php

	echo "file : info.php created !"


	echo " "
	echo "###############################"
	echo "#### Installation Maria-db ####"
	echo "###############################"
	echo " "

	sleep 2

	apt-get -y --force-yes install mariadb-client mariadb-server


	echo " "
	echo "#################################"
	echo "#### Installation Phpmyadmin ####"
	echo "#################################"
	echo " "

	sleep 2

	apt-get -y --force-yes install phpmyadmin


	echo " "
	echo "#################################"
	echo "#### Redemarrage des service ####"
	echo "#################################"
	echo " "

	sleep 2

	/etc/init.d/apache2 restart


	echo " "
	echo "###########################################"
	echo "#### Installation CURL, GIT, UNZIP, ZIP ####"
	echo "###########################################"
	echo " "

	sleep 2

	apt-get -y --force-yes install curl git unzip zip

	echo -n "Voulez vous installer letsencrypt ? [ Y, N ] :"
	
	read yn

	if [ "$yn" = "y" ] || [ "$yn" = "Y" ]; then
		echo " "
		echo "##################################"
		echo "#### Installation letsencrypt ####"
		echo "##################################"
		echo " "

		sleep 2

		cd /etc && git clone https://github.com/letsencrypt/letsencrypt && cd letsencrypt && ./letsencrypt-auto --help
	else
		
		echo " "
		echo "########################"
		echo "#### Etape suivante ####"
		echo "########################"
		echo " "
		
		sleep 1

	fi


	sleep 1

	echo -n "Voulez vous installer un serveur ftp ( ProFtpd ) ? [ Y, N ] :"

	read yn

	if [ "$yn" = "y" ] || [ "$yn" = "Y" ]; then
		echo " "
		echo "##################################"
		echo "#### Installation de ProFtpd ####"
		echo "##################################"
		echo " "

		sleep 2

		apt-get -y --force-yes install proftpd

		sleep 1
		
		/etc/init.d/proftpd status

		sleep 1
	
		netstat -tanpu | grep :21

		sleep 1

		echo " "
		echo "#########################################################"
		echo "#### Sauvegarde du fichier de configuration, ProFtpd ####"
		echo "#########################################################"
		echo " "
		
		cp /etc/proftpd/proftpd.conf /etc/proftpd/proftpd.conf.save

		sleep 1

		service proftpd restart


	else
		
		echo " "
		echo "########################"
		echo "#### Etape suivante ####"
		echo "########################"
		echo " "
		
		sleep 1

	fi


	echo " "
	echo "#################################################"
	echo "#### Création du lien symbolique, phpmyadmin ####"
	echo "#################################################"
	echo " "

	sleep 2

	ln -s /etc/phpmyadmin/apache.conf  /etc/apache2/sites-available/phpmyadmin.conf & a2ensite phpmyadmin

	sleep 1

	/etc/init.d/apache2 restart


	echo " "
	echo "#################################"
	echo "#### Redemarrage des service ####"
	echo "#################################"
	echo " "

	sleep 2

	/etc/init.d/apache2 restart

	sleep 1

	/etc/init.d/proftpd restart

	sleep 1
	
	/etc/init.d/mysql reload


	echo " "
	echo "#################################"
	echo "#### Installation terminée ! ####"
	echo "#################################"
	echo " "




elif [ "$choice" = "8" ]; then

	echo " "
	echo "#############################################"
	echo "#### DEBIAN 8 -- Web server installation ####"
	echo "#############################################"
	echo " "

	date

	sleep 2

	echo " "
	echo "##################################"
	echo "#### Mise à jour du sytème... ####"
	echo "##################################"
	echo " "

	sleep 2

	apt-get update && apt-get upgrade

	echo " "
	echo "################################"
	echo "#### Installation net-tools ####"
	echo "################################"
	echo " "

	sleep 2

	apt-get install net-tools

	ifconfig

	echo " "
	echo "#############################"
	echo "#### Installation Apache ####"
	echo "#############################"
	echo " "

	sleep 2

	apt-get -y --force-yes install apache2
	netstat -tanpu |grep :80
	ls /var/log/apache2/


	echo " "
	echo "#############################"
	echo "#### Installation PHP5 ####"
	echo "#############################"
	echo " "

	sleep 2

	apt-get -y --force-yes install php5 libapache2-mod-php5

	/etc/init.d/apache2 restart

	apt-cache search php5

	apt-get -y --force-yes install php5-mysql php5-curl php5-gd php5-intl php-pear php5-imagick php5-imap php5-mcrypt php5-memcache php5-ming php5-ps php5-pspell php5-recode php5-snmp php5-sqlite php5-tidy php5-xmlrpc php5-xsl
	
	/etc/init.d/apache2 restart

	apt-get -y --force-yes install php-apc

	/etc/init.d/apache2 restart


	echo " "
	echo "######################################"
	echo "#### Création du fichier info.php ####"
	echo "######################################"
	echo " "

	sleep 2

	touch /var/www/html/info.php

	echo "<?php phpinfo(); ?>" >> /var/www/html/info.php

	echo "file : info.php created !"


	echo " "
	echo "###############################"
	echo "#### Installation Maria-db ####"
	echo "###############################"
	echo " "

	sleep 2

	apt-get -y --force-yes install mariadb-client mariadb-server


	echo " "
	echo "#################################"
	echo "#### Installation Phpmyadmin ####"
	echo "#################################"
	echo " "

	sleep 2

	apt-get -y --force-yes install phpmyadmin


	echo " "
	echo "#################################"
	echo "#### Redemarrage des service ####"
	echo "#################################"
	echo " "

	sleep 2

	/etc/init.d/apache2 restart


	echo " "
	echo "###########################################"
	echo "#### Installation CURL, GIT, UNZIP, ZIP ####"
	echo "###########################################"
	echo " "

	sleep 2

	apt-get -y --force-yes install curl git unzip zip

	echo -n "Voulez vous installer letsencrypt ? [ Y, N ] :"
	
	read yn

	if [ "$yn" = "y" ] || [ "$yn" = "Y" ]; then
		echo " "
		echo "##################################"
		echo "#### Installation letsencrypt ####"
		echo "##################################"
		echo " "

		sleep 2

		cd /etc && git clone https://github.com/letsencrypt/letsencrypt && cd letsencrypt && ./letsencrypt-auto --help
	else
		
		echo " "
		echo "########################"
		echo "#### Etape suivante ####"
		echo "########################"
		echo " "
		
		sleep 1

	fi


	sleep 1

	echo -n "Voulez vous installer un serveur ftp ( ProFtpd ) ? [ Y, N ] :"

	read yn

	if [ "$yn" = "y" ] || [ "$yn" = "Y" ]; then
		echo " "
		echo "##################################"
		echo "#### Installation de ProFtpd ####"
		echo "##################################"
		echo " "

		sleep 2

		apt-get -y --force-yes install proftpd

		sleep 1
		
		/etc/init.d/proftpd status

		sleep 1
	
		netstat -tanpu | grep :21

		sleep 1

		echo " "
		echo "#########################################################"
		echo "#### Sauvegarde du fichier de configuration, ProFtpd ####"
		echo "#########################################################"
		echo " "
		
		cp /etc/proftpd/proftpd.conf /etc/proftpd/proftpd.conf.save

		sleep 1

		service proftpd restart


	else
		
		echo " "
		echo "########################"
		echo "#### Etape suivante ####"
		echo "########################"
		echo " "
		
		sleep 1

	fi


	echo " "
	echo "#################################################"
	echo "#### Création du lien symbolique, phpmyadmin ####"
	echo "#################################################"
	echo " "

	sleep 2

	ln -s /etc/phpmyadmin/apache.conf  /etc/apache2/sites-available/phpmyadmin.conf & a2ensite phpmyadmin

	sleep 1

	/etc/init.d/apache2 restart


	echo " "
	echo "#################################"
	echo "#### Redemarrage des service ####"
	echo "#################################"
	echo " "

	sleep 2

	/etc/init.d/apache2 restart

	sleep 1

	/etc/init.d/proftpd restart

	sleep 1
	
	/etc/init.d/mysql reload


	echo " "
	echo "#################################"
	echo "#### Installation terminée ! ####"
	echo "#################################"
	echo " "

elif [ "$choice" = "9" ]; then

	echo " "
	echo "#############################################"
	echo "#### DEBIAN 9 -- Web server installation ####"
	echo "#############################################"
	echo " "

	date

	sleep 2

	echo " "
	echo "##################################"
	echo "#### Mise à jour du sytème... ####"
	echo "##################################"
	echo " "

	sleep 2

	apt-get update && apt-get upgrade


	echo " "
	echo "################################"
	echo "#### Installation net-tools ####"
	echo "################################"
	echo " "

	sleep 2

	apt-get install net-tools

	ifconfig

	echo " "
	echo "#############################"
	echo "#### Installation Apache ####"
	echo "#############################"
	echo " "

	sleep 2

	apt-get -y --force-yes install apache2 apache2-mod-php7.0
	netstat -tanpu |grep :80
	ls /var/log/apache2/


	echo " "
	echo "#############################"
	echo "#### Installation PHP7.0 ####"
	echo "#############################"
	echo " "

	sleep 2

	apt-get -y --force-yes install php7.0 php7.0-mysql libapache2-mod-php7.0 php7.0-gd php7.0-opcache

	sleep 1



	echo " "
	echo "######################################"
	echo "#### Création du fichier info.php ####"
	echo "######################################"
	echo " "

	sleep 2

	touch /var/www/html/info.php

	echo "<?php phpinfo(); ?>" >> /var/www/html/info.php

	echo "file : info.php created !"


	echo " "
	echo "###############################"
	echo "#### Installation Maria-db ####"
	echo "###############################"
	echo " "

	sleep 2

	apt-get -y --force-yes install mariadb-client mariadb-server


	echo " "
	echo "#################################"
	echo "#### Installation Phpmyadmin ####"
	echo "#################################"
	echo " "

	sleep 2

	apt-get -y --force-yes install phpmyadmin


	echo " "
	echo "#################################"
	echo "#### Redemarrage des service ####"
	echo "#################################"
	echo " "

	sleep 2

	/etc/init.d/apache2 restart



	echo " "
	echo "###########################################"
	echo "#### Installation CURL, GIT, UNZIP, ZIP ####"
	echo "###########################################"
	echo " "

	sleep 2

	apt-get -y --force-yes install curl git unzip zip

	echo -n "Voulez vous installer letsencrypt ? [ Y, N ] :"
	
	read yn

	if [ "$yn" = "y" ] || [ "$yn" = "Y" ]; then
		echo " "
		echo "##################################"
		echo "#### Installation letsencrypt ####"
		echo "##################################"
		echo " "

		sleep 2

		cd /etc && git clone https://github.com/letsencrypt/letsencrypt && cd letsencrypt && ./letsencrypt-auto --help
	else
		
		echo " "
		echo "########################"
		echo "#### Etape suivante ####"
		echo "########################"
		echo " "
		
		sleep 1

	fi

	
	echo -n "Voulez vous installer un serveur ftp ( ProFtpd ) ? [ Y, N ] :"

	read yn

	if [ "$yn" = "y" ] || [ "$yn" = "Y" ]; then
		echo " "
		echo "##################################"
		echo "#### Installation de ProFtpd ####"
		echo "##################################"
		echo " "

		sleep 2

		apt-get -y --force-yes install proftpd

		sleep 1
		
		/etc/init.d/proftpd status

		sleep 1
	
		netstat -tanpu | grep :21

		sleep 1

		echo " "
		echo "#########################################################"
		echo "#### Sauvegarde du fichier de configuration, ProFtpd ####"
		echo "#########################################################"
		echo " "
		
		cp /etc/proftpd/proftpd.conf /etc/proftpd/proftpd.conf.save

		sleep 1

		service proftpd restart


	else
		
		echo " "
		echo "########################"
		echo "#### Etape suivante ####"
		echo "########################"
		echo " "
		
		sleep 1

	fi


	echo " "
	echo "#################################################"
	echo "#### Création du lien symbolique, phpmyadmin ####"
	echo "#################################################"
	echo " "

	sleep 2

	ln -s /etc/phpmyadmin/apache.conf  /etc/apache2/sites-available/phpmyadmin.conf & a2ensite phpmyadmin

	sleep 1

	/etc/init.d/apache2 restart


	echo " "
	echo "#################################"
	echo "#### Redemarrage des service ####"
	echo "#################################"
	echo " "

	sleep 2

	/etc/init.d/apache2 restart

	sleep 1

	/etc/init.d/proftpd restart

	sleep 1
	
	/etc/init.d/mysql reload


	sleep 1

	echo " "
	echo "#################################"
	echo "#### Installation terminée ! ####"
	echo "#################################"
	echo " "

else
	
	echo " "
	echo "#######################################"
	echo "#### il faut choisir une version ! ####"
	echo "#######################################"
	echo " "

fi


exit 0
