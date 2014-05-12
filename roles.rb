# where puppet will be installed
def role_puppet
  $myxp.get_deployed_nodes('capi5k-init')
end

# puppet version to use (env var)
def puppet_version
  "PUPPET_VERSION=2.7.19"
end

