//
//  battery.swift
//  Battery Monitor
//
//  Created by 賴勇典 on 2023/11/20.
//

import IOKit

class Battery {
    let source = IOServiceGetMatchingService(kIOMainPortDefault, IOServiceMatching("IOPMPowerSource"))
    let key_capacity = "CurrentCapacity" as CFString
    let key_connected = "ExternalConnected" as CFString

    var current_capacity: Unmanaged<CFTypeRef>?
    var external_connected: Unmanaged<CFTypeRef>?
    var capacity: UInt?
    var connected: Bool?
    var state: Int?
    
    func get_state() {
        current_capacity = IORegistryEntryCreateCFProperty(source, key_capacity, kCFAllocatorDefault, 0)
        capacity = current_capacity?.takeRetainedValue() as? UInt
        current_capacity?.release()
        
        external_connected = IORegistryEntryCreateCFProperty(source, key_connected, kCFAllocatorDefault, 0)
        connected = external_connected?.takeRetainedValue() as? Bool
        external_connected?.release()

        if capacity! > 70 && connected! {
            state = 2
        }
        else if capacity! < 30 && !connected! {
            state = 1
        }
        else {
            state = 0
        }
    }
    
    deinit {
        IOObjectRelease(source)
    }
}
