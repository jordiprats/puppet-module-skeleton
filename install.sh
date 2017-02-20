#!/bin/bash

PUPPETBIN=$(which puppet 2>/dev/null)

if [ -z "$PUPPETBIN" ];
then
	echo "puppet not found"
	exit 1
fi

if [ "$(id -u)" -eq 0 ];
then
  INSTALLDIR="/usr/lib/ruby/vendor_ruby/puppet/module_tool/skeleton/templates/generator"
else
  case $(puppet --version) in
    3*)
      INSTALLDIR="$HOME/.puppet/var/puppet-module/skeleton"
      ;;
    4*)
      INSTALLDIR="$HOME/.puppetlabs/opt/puppet/cache/puppet-module/"
      ;;
  esac
fi

#mkdir per si no hi ha l'estructura
mkdir -p ${INSTALLDIR}

#netejem coses ja presents
rm -fr ${INSTALLDIR}
cp -pr skeleton ${INSTALLDIR}
find ${INSTALLDIR} -iname .gitkeep -empty -delete
