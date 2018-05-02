#!/bin/bash

PUPPETBIN=$(which puppet 2>/dev/null)

if [ -z "$PUPPETBIN" ];
then
  PUPPETBIN=$(find /opt/puppetlabs/ -iname puppet -type f 2>/dev/null | grep bin/puppet)
  if [ -z "$PUPPETBIN" ];
  then
    echo "puppet not found"
    exit 1
  fi
fi

if [ "$(id -u)" -eq 0 ];
then
  case $($PUPPETBIN --version) in
    3*)
      INSTALLDIR="/usr/lib/ruby/vendor_ruby/puppet/module_tool/skeleton/templates/generator"
      ;;
    4*)
      INSTALLDIR="/opt/puppetlabs/puppet/lib/ruby/vendor_ruby/puppet/module_tool/skeleton/templates/generator"
      ;;
  esac
else
  case $($PUPPETBIN --version) in
    3*)
      INSTALLDIR="$HOME/.puppet/var/puppet-module/skeleton"
      ;;
    4*)
      INSTALLDIR="$(puppet apply --configprint module_working_dir)"
      ;;
    5*)
      INSTALLDIR="$(puppet apply --configprint module_working_dir)"
      ;;
  esac
fi

if [ -z "${INSTALLDIR}" ];
then
  echo "INSTALLDIR not found"
  exit 1
fi

#mkdir per si no hi ha l'estructura
mkdir -p ${INSTALLDIR}

#netejem coses ja presents
rm -fr ${INSTALLDIR}
cp -pr skeleton ${INSTALLDIR}
find ${INSTALLDIR} -iname .gitkeep -empty -delete
