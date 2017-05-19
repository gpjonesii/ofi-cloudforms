task = $evm.root['service_template_provision_task']
environment = $evm.root['dialog_tag_0_environment'][0]

case environment
when "sandbox" then infoblox_nic_0_network = '10.17.7.0/20'
when "dev"     then infoblox_nic_0_network = '10.17.7.0/20'
when "qa"      then infoblox_nic_0_network = '10.17.7.0/20'
when "prod"    then infoblox_nic_0_network = '10.17.7.0/20'
end

unless infoblox_nic_0_network.nil?
  task.miq_request_tasks.each do |child_task|
    child_task.set_dialog_option(:dialog_infoblox_nic_0_network, infoblox_nic_0_network )
  end
end
