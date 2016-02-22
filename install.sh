#!/bin/bash

#TODO: the skeleton is working only for non-root users.

case $(puppet --version) in
  3*)
    #~/.puppet/var/puppet-module/skeleton
    INSTALLDIR="/usr/lib/ruby/vendor_ruby/puppet/module_tool/skeleton/templates/generator"
    ;;
  4*)
    INSTALLDIR="$HOME/.puppetlabs/opt/puppet/cache/puppet-module/"
    ;;
esac

rm -fr ${INSTALLDIR}/*
cp -pr skeleton/* skeleton/.* ${INSTALLDIR}
find ${INSTALLDIR} -iname .gitkeep -empty -delete
