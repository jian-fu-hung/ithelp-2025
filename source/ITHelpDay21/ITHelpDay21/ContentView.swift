///**
/**

ITHelpDay21
Created by:  Jerry  on 2025/10/6
Copyright (c) 2017 My Company

*/

import SwiftUI
import UserNotifications

struct ContentView: View {
    
    @StateObject private var notificationManager = NotificationManager()
    
    var body: some View {
        VStack {
            Button("發送本地推播") {
                notificationManager.sendLocalNotification()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
