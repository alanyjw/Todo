require 'simctl'

device = SimCtl.device(name: 'Unit Tests @ iPhone 6s 9.3')

puts "Waiting for device to shutdown..."
device.shutdown!
device.kill!

device.wait! {|d| d.state == :shutdown}
puts "Device shutdown!"

device.delete!
