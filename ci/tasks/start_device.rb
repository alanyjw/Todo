require 'simctl'

runtime_name = 'iOS 9.3'
runtime = SimCtl.runtime(name: runtime_name)

type_name = 'iPhone 6s'
devicetype = SimCtl.devicetype(name: type_name)

device_name = 'Unit Tests @ iPhone 6s 9.3'

device = SimCtl.create_device device_name, devicetype, runtime
puts "Created device: { name: '#{device_name}', runtime: '#{runtime_name}', type: '#{type_name}', udid: '#{device.udid}' }"

device.launch!
puts "Device launched!"

puts "Waiting for device to boot..."
device.wait! {|d| d.state == :booted}
puts "Device booted!"
