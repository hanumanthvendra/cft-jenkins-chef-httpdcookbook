#!/bin/bash
yum update -y aws-cfn-bootstrap
yum update -y
yum install git -y
export HOME='/root'
/usr/bin/curl -L https://www.opscode.com/chef/install.sh | bash
/bin/mkdir -p /root/chef-repo/.chef
cd /root/chef-repo/.chef
curl -o knife.rb http://54.81.9.13/knife.rb
curl -o abdul7.pem http://54.81.9.13/abdul7.pem
knife ssl fetch
cd /root/chef-repo
/bin/mkdir -p /etc/chef
cd /etc/chef
curl -o abdul-validator.pem http://54.81.9.13/abdul-validator.pem
curl -o client.rb http://54.81.9.13/client.rb
cp -far /root/chef-repo/.chef/trusted_certs /etc/chef/
/usr/sbin/ntpdate -q 0.europe.pool.ntp.org
$(which chef-client) --once
cd /root/chef-repo/.chef
knife node run_list add $(hostname -f) 'recipe[http_cookbook::default]' 
$(which chef-client) -o role['chef-config']
$(which chef-client) --daemonize -i 180
