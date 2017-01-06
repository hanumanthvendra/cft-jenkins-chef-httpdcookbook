log_level        :info
log_location     STDOUT
chef_server_url  'https://manage.chef.io/organizations/hanumanth'
validation_client_name 'hanumanth-validator'
validation_key '/etc/chef/hanumanth-validator.pem'
client_key '/etc/chef/client.pem'
ssl_verify_mode    :verify_none