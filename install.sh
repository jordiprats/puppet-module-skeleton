#!/bin/bash

PUPPETBIN=$(which puppet 2>/dev/null)

if [ -z "$PUPPETBIN" ];
then
  echo "puppet not found"
  exit 1
fi

if [ "$(id -u)" -eq 0 ];
then
  case $(puppet --version) in
    3*)
      INSTALLDIR="/usr/lib/ruby/vendor_ruby/puppet/module_tool/skeleton/templates/generator"
      ;;
    4)
      INSTALLDIR="/opt/puppetlabs/puppet/lib/ruby/vendor_ruby/puppet/module_tool/skeleton/templates/generator"
      ;;
  esac
else
  case $(puppet --version) in
    3*)
      INSTALLDIR="$HOME/.puppet/var/puppet-module/skeleton"
      ;;
    4*)
      INSTALLDIR="$(puppet apply --configprint module_working_dir)"
      ;;
  esac
fi

#mkdir per si no hi ha l'estructura
mkdir -p ${INSTALLDIR}

#netejem coses ja presents
rm -fr ${INSTALLDIR}
cp -pr skeleton ${INSTALLDIR}
find ${INSTALLDIR} -iname .gitkeep -empty -delete
