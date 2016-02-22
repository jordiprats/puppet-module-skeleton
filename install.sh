#!/bin/bash

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
rm -fr ${INSTALLDIR}
cp -pr skeleton ${INSTALLDIR}
find ${INSTALLDIR} -iname .gitkeep -empty -delete
