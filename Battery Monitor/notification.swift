//
//  notification.swift
//  Battery Monitor
//
//  Created by 賴勇典 on 2023/11/20.
//

import UserNotifications

func check_authorization() {
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { y, n in }
}

func make_notification(title: String) {
    UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.0001, repeats: false)
    
    let content = UNMutableNotificationContent()
    content.title = title
    content.sound = UNNotificationSound.default
    
    let request = UNNotificationRequest(identifier: "", content: content, trigger: trigger)
    
    UNUserNotificationCenter.current().add(request)
}
