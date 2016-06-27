
# the default location for files for our kitchen setup is in a local share
# ~/chef-kits/chef.  This is mounted to /mnt/share/chef on the target vm
# if you alreddy have these in an rpm repo, set source_files to false
# You can also replae file:// with https:// for remote repos.
node.override['delivery_build']['use_package_manager'] = false
node.override['delivery_build']['base_package_url'] = 'file:///mnt/share/chef'
# note the package "name" must match the name used by yum/rpm etc.
# get your package list here https://packages.chef.io/stable/el/7/
node.override['delivery_build']['packages']['chefdk'] = 'chefdk-0.15.15-1.el7.x86_64.rpm'
node.override['delivery_build']['packages']['push-jobs-client'] ='push-jobs-client-1.3.4-1.el7.x86_64.rpm'
node.override['delivery_build']['packages']['runit'] ='runit-2.1.2-3.el7.centos.x86_64.rpm'
# add the delivery local user on the box
# but allow it to be skipped if already created
# in Linux based logins connected to ldap
node.override['delivery_build']['linux_user_based_ldap'] = false
node.override['delivery_build']['user'] = 'dbuild'
node.override['delivery_build']['uid'] = '7100'
node.override['delivery_build']['gid'] = 'users'
node.override['delivery_build']['home'] = '/var/opt/delivery/workspace'
# Load up the builder private ssh key and the chef delivery user's pem key
node.override['delivery_build']['base_filename_url'] = 'file:///mnt/share/chef/'

# Stuff related to credentials
node.override['delivery_build']['secrets_type'] = 'local-files'
node.override['delivery_build']['chef_username'] = 'srv-delivery'

# Delivery and SUpermarket URL's to retrieve their certificates
node.override['delivery_build']['url']['chef'] = 'chef.myorg.chefdemo.net'
node.override['delivery_build']['url']['delivery'] = 'delivery.myorg.chefdemo.net'
node.override['delivery_build']['url']['supermarket'] = 'supermarket.myorg.chefdemo.net'
node.override['delivery_build']['organisation'] = 'myorg'
# assume this node has alredy been bootstrapped
node.override['delivery_build']['url_chef']  = 'https://chef.myorg.chefdemo.net'
