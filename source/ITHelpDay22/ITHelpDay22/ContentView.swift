///**
/**

ITHelpDay22
Created by:  Jerry  on 2025/10/7
Copyright (c) 2017 My Company

*/

import SwiftUI

struct ContentView: View {
    @StateObject private var notificationManager = NotificationManager()
        
        var body: some View {
            NavigationStack {
                VStack(spacing: 20) {
                    Text("Swift 鐵人賽 Day 21")
                        .font(.title2)
                    
                    Button("發送學習提醒通知") {
                        notificationManager.sendLocalNotification()
                    }
                    .buttonStyle(.borderedProminent)
                    
                    Button("發送分類通知") {
                        notificationManager.sendInteractiveNotification()
                    }
                    .buttonStyle(.borderedProminent)
                }
                .navigationDestination(isPresented: $notificationManager.navigateToLearningPage) {
                    LearningView()
                }
            }
        }
}

struct LearningView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("學習進度頁面")
                .font(.title)
            Text("歡迎回來，繼續挑戰 Swift 鐵人賽吧！")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
