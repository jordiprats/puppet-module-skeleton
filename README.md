# puppet-module-skeleton

The built-in puppet-module tool can be configured to use a custom template to
generate new modules. By installing this the generated module will have:

- **class.pp** and **params.pp** created with OS support checking already in place
- skeleton for:
  * **install.pp**: to install packages
  * **config.pp**: to configure the service
  * **service.pp**: to manage the service
- basic support for
  * **rspec** (checks for supported and unsupported OS)
  * **beaker** (OS dependant variables and basic setup)
- **.gitignore** with common files to be ignored
- **.fixtures.yml** with puppetlabs-stdlib
- **Gemfile** for beaker testing
- **Rakefile** with metadata-json-lint and disabled some annoying lint checks
- **metadata.json** configured for CentOS 5,6,7 and Ubuntu 14.04 support
- basic **README.md** template

## Install

Run install.sh to install

```
bash install.sh
```

## Reference

### root

default template:
**/usr/lib/ruby/vendor_ruby/puppet/module_tool/skeleton/templates/generator**

### non root users

#### puppet3
**~/.puppet/var/puppet-module/skeleton**

#### puppet4
**~/.puppetlabs/opt/puppet/cache/puppet-module**
