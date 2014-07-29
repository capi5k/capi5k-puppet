set :puppet_path, "#{recipes_path}/capi5k-puppet"

load "#{puppet_path}/roles.rb"
load "#{puppet_path}/roles_definition.rb"
load "#{puppet_path}/output.rb"

set :proxy, "https_proxy=http://proxy:3128 http_proxy=http://proxy:3128"
set :apt_get_p, "#{proxy} apt-get"

namespace :puppet do
 
  desc 'Should install puppet on nodes' 
  task :default, :roles => [:puppet] do
    set :user, "root"
    env = "PUPPET_VERSION=#{puppet_version}"
    env += " #{proxy}"
    run "#{apt_get_p} update && #{apt_get_p} install -y curl" 
    run "#{apt_get_p} install -y rubygems" 
    run "#{proxy} curl -L  https://raw.githubusercontent.com/pmorillon/puppet-puppet/master/extras/bootstrap/puppet_install.sh | #{env} sh"
  end

end
