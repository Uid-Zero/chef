# Cookbook Name:: securityPatch
# Recipe:: default


if node['platform'] == 'redhat'
  if node['platform_version'].to_i != 5
    # Satellite 6 doesn't support rhel5 or earlier

    # include the ohai custom plugin rhsm_status
    ohai_hint 'rhsm_status'
  end

  # add to the patching schedule
  include_recipe 'securityPatch::updates'
end
