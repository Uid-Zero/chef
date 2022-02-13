Ohai.plugin(:Rhsm) do
  provides 'rhsm/status'

  collect_data(:default) do
    rhsm Mash.new
    rhsm_cmd = shell_out("subscription-manager status | tail -2 | grep -v -e '^[[:space:]]*$' | awk '{ print $3 }'")
    rhsm[:status] = rhsm_cmd.stdout
  end
end