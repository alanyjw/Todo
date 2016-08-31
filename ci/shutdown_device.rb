require 'simctl'

device = SimCtl.device(name: 'Unit Tests @ iPhone 6s 9.3')

device.shutdown!
device.kill!

device.wait! {|d| d.state == :shutdown}

device.delete!
