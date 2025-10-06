///**
/**

ITHelpDay21
Created by:  Jerry  on 2025/10/6
Copyright (c) 2017 My Company

*/
import SwiftUI
import UserNotifications

class NotificationManager: NSObject, ObservableObject, UNUserNotificationCenterDelegate {
    override init() {
        super.init()
        // 註冊通知權限
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                print("使用者允許通知")
            } else {
                print("使用者拒絕通知")
            }
        }
        // 指定 delegate
        UNUserNotificationCenter.current().delegate = self
    }
    
    // 實作前景通知顯示
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // App 在前景時也顯示通知
        completionHandler([.banner, .sound])
    }
    
    // 發送通知
    func sendLocalNotification() {
        let content = UNMutableNotificationContent()
        content.title = "提醒你一下"
        content.body = "該回來繼續學 Swift 鐵人賽囉！"
        content.sound = .default

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        let request = UNNotificationRequest(identifier: "SwiftDay20", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}
