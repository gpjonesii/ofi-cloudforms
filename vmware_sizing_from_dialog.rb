task = $evm.root['service_template_provision_task']
vm_size = $evm.root['dialog_vm_size']
task.miq_request_tasks.each do |child_task|
  case vm_size
  when "small"
    num_sockets = 1
    num_cores = 1
    mem_size = '2048'
  when "medium"
    num_sockets = 2
    num_cores = 1
    mem_size = '4096'
  when "large"
    num_sockets = 2
    num_cores = 2
    mem_size = '8192'
  end
  child_task.set_dialog_option(:dialog_number_of_sockets, num_sockets)
  child_task.set_dialog_option(:dialog_cores_per_socket, num_cores)
  child_task.set_dialog_option(:dialog_memory, mem_size)
end
