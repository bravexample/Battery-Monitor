//
//  Battery_MonitorApp.swift
//  Battery Monitor
//
//  Created by 賴勇典 on 2023/11/20.
//

import SwiftUI

@main
struct Battery_MonitorApp: App {
    init() {
        monitoring()
    }
    
    var body: some Scene {
        WindowGroup {
            Text("監視電池中")
        }
    }
}
