///**
/**

ITHelpDay22
Created by:  Jerry  on 2025/10/7
Copyright (c) 2017 My Company

*/

import SwiftUI
import UserNotifications

class NotificationManager: NSObject, ObservableObject, UNUserNotificationCenterDelegate {
    @Published var navigateToLearningPage = false

    override init() {
        super.init()
        UNUserNotificationCenter.current().delegate = self
        requestAuthorization()
        setupNotificationActions()
    }

    private func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            print(granted ? "使用者允許通知" : "使用者拒絕通知")
        }
    }

    func sendLocalNotification() {
        let content = UNMutableNotificationContent()
        content.title = "學習提醒"
        content.body = "該回來繼續學 Swift 鐵人賽囉！"
        content.sound = .default

        let request = UNNotificationRequest(
            identifier: "open_learning",
            content: content,
            trigger: UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        )

        UNUserNotificationCenter.current().add(request)
    }
    
    func setupNotificationActions() {
        let markDoneAction = UNNotificationAction(
            identifier: "MARK_DONE",
            title: "完成",
            options: [.authenticationRequired]
        )
        
        let remindLaterAction = UNNotificationAction(
            identifier: "REMIND_LATER",
            title: "稍後提醒",
            options: []
        )
        
        let taskCategory = UNNotificationCategory(
            identifier: "TASK_CATEGORY",
            actions: [markDoneAction, remindLaterAction],
            intentIdentifiers: [],
            options: []
        )
        
        UNUserNotificationCenter.current().setNotificationCategories([taskCategory])
    }
    
    func sendInteractiveNotification() {
        let content = UNMutableNotificationContent()
        content.title = "待辦任務"
        content.body = "今天的 Swift 鐵人賽任務還沒完成！"
        content.sound = .default
        content.categoryIdentifier = "TASK_CATEGORY" // 綁定分類
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        let request = UNNotificationRequest(identifier: "TASK_NOTIFICATION", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }

    // 前景顯示通知
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound])
    }

    // 點擊通知事件
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        let actionId = response.actionIdentifier
        let notificationId = response.notification.request.identifier
        
        print("使用者點擊通知：\(notificationId), 按鈕：\(actionId)")
        
        switch actionId {
        case "MARK_DONE":
            print("任務已完成")
        case "REMIND_LATER":
            print("稍後提醒")
        case UNNotificationDefaultActionIdentifier:
            print("使用者點擊通知本身")
        default:
            break
        }
        
        completionHandler()
    }
}

