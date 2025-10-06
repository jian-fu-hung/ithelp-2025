///**
/**

ITHelpDay21
Created by:  Jerry  on 2025/10/6
Copyright (c) 2017 My Company

*/

import UIKit
import UserNotifications

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // 設定通知代理
        UNUserNotificationCenter.current().delegate = self

        // 申請通知權限
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
            guard granted else {
                print("使用者拒絕通知權限")
                return
            }

            DispatchQueue.main.async {
                // 註冊 APNs
                application.registerForRemoteNotifications()
            }
        }

        return true
    }

    // 取得 Device Token 成功
    func application(_ application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let token = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        print("Device Token: \(token)")
    }

    // 註冊失敗
    func application(_ application: UIApplication,
                     didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("無法註冊 APNs: \(error.localizedDescription)")
    }

    // 前景時顯示通知
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler:
                                    @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound])
    }
}
