require 'simctl'

runtime = SimCtl.runtime(name: 'iOS 9.3')

devicetype = SimCtl.devicetype(name: 'iPhone 6s')

device = SimCtl.create_device 'Unit Tests @ iPhone 6s 9.3', devicetype, runtime

device.launch!

device.wait! {|d| d.state == :booted}
