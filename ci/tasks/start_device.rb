require 'simctl'

runtime_name = 'iOS 9.3'
runtime = SimCtl.runtime(name: runtime_name)

type_name = 'iPhone 6s'
devicetype = SimCtl.devicetype(name: type_name)

device_name = 'iPhone 6s'

existing_device = SimCtl.list_devices.find_all { |d| d.name =~ /#{device_name}/ }
puts "Deleting device#{"s" if existing_device.size > 1}..." if existing_device.any?
existing_device.map do |d|
  if d.state != :shutdown
    d.shutdown!
    d.kill!
    d.wait! { |d| d.state == :shutdown }
  end

  d.delete!

  begin
    puts "Deleted device: { name: '#{d.name}', runtime: '#{ d.runtime.name if d.runtime }', type: '#{ d.devicetype.name if d.devicetype }', udid: '#{d.udid}' }"
  rescue StandardError => e
    puts "Error encountered while logging..."
    puts e
  end
end

device = SimCtl.create_device device_name, devicetype, runtime
puts "Created device: { name: '#{device_name}', runtime: '#{runtime_name}', type: '#{type_name}', udid: '#{device.udid}' }"

device.launch!
puts "Device launched!"

puts "Waiting for device to boot..."
device.wait! {|d| d.state == :booted}
puts "Device booted!"
