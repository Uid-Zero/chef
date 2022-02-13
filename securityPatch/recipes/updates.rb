#
# Cookbook Name:: securityPatch
# Recipe:: updates

## ENABLE AUTOMATIC UPDATES ###

# check if recipe should be run
unless node['securityPatch']['updates']['enabled']
  ::Chef::Log.warn('Processing of securityPatch::updates is disabled')
  return
end

server = search('updates', "id:#{node['fqdn']}").first
unless server.nil?
  cron 'Yum automatic patching' do
    minute server['minute']
    hour server['hour']
    weekday server['weekday']
    day server['day']
    user 'root'
    command "#{server['day_range']} && /etc/yum/update.sh && /sbin/reboot"
    action :create
  end
  template '/etc/yum/update.sh' do
    source 'update.erb'
    user 'root'
    group 'root'
    mode '0755'
    variables(
      exclude: 'kernel*'
    )
  end
end