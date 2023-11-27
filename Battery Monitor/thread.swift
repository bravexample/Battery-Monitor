//
//  thread.swift
//  Battery Monitor
//
//  Created by 賴勇典 on 2023/11/20.
//

import Foundation

func monitor() {
    check_authorization()
    
    let battery = Battery()
    
    while true {
        battery.get_state()
        
        switch battery.state {
        case 2:
            make_notification(title: "電量充足")
            break
            
        case 1:
            make_notification(title: "電量不足")
            break
            
        default:
            break
        }
        
        Thread.sleep(forTimeInterval: 60)
    }
}

func monitoring() {
    let monitor = Thread(block: monitor)
    monitor.start()
}
