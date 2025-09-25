///**
/**

ITHelpDay12
Created by:  Jerry  on 2025/9/25
Copyright (c) 2017 My Company

*/

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

class UserData: ObservableObject {
    @Published var score = 0
}

struct ObservedExampleView: View {
    @ObservedObject var userData = UserData()

    var body: some View {
        VStack {
            Text("目前分數：\(userData.score)")
                .font(.title)

            Button("加一") {
                userData.score += 1
            }
            .padding()

            // 傳給子 View
            ScoreDetailView(userData: userData)
        }
    }
}

struct ScoreDetailView: View {
    @ObservedObject var userData: UserData

    var body: some View {
        VStack {
            Text("子畫面分數：\(userData.score)")
                .foregroundColor(.blue)
            Button("加一") {
                userData.score += 1
            }
        }

    }
}

//--------------------------------------//

struct BadExampleView: View {

    @State var isShow = true

    var body: some View {
        VStack {
            Text("Current User: \(isShow ? "A狀態" : "B狀態")")
            Button("父畫面切換換狀態") {
                isShow.toggle()
            }
            BadScoreDetailView()
            GoogScoreDetailView()
        }
    }
}

struct BadScoreDetailView: View {
    @ObservedObject var userData: UserData = UserData()

    var body: some View {
        VStack {
            Text("錯誤子畫面分數：\(userData.score)")
                .foregroundColor(.blue)
            Button("加一") {
                userData.score += 1
            }
        }

    }
}

struct GoogScoreDetailView: View {
    @StateObject var userData: UserData = UserData()

    var body: some View {
        VStack {
            Text("正確的子畫面分數：\(userData.score)")
                .foregroundColor(.blue)
            Button("加一") {
                userData.score += 1
            }
        }

    }
}

//--------------------------------------//

// 共享的資料模型
class AppSettings: ObservableObject {
    @Published var isDarkMode = false
}

struct EnvironmentExampleView: View {
    @StateObject var settings = AppSettings()  // 建立唯一資料來源

    var body: some View {
        VStack {
            Toggle("深色模式", isOn: $settings.isDarkMode)
                .padding()

            ChildAView()  // 不用手動傳，直接共享
            ChildBView()
        }
        .environmentObject(settings)  // 注入環境
    }
}

struct ChildAView: View {
    @EnvironmentObject var settings: AppSettings

    var body: some View {
        Text(settings.isDarkMode ? "深色模式 ON" : "深色模式 OFF")
            .foregroundColor(.green)
    }
}

struct ChildBView: View {
    @EnvironmentObject var settings: AppSettings

    var body: some View {
        Button("切換模式") {
            settings.isDarkMode.toggle()
        }
    }
}

//--------------------------------------//

#Preview {
    ContentView()
}

#Preview {
    ObservedExampleView()
}

#Preview {
    BadExampleView()
}

#Preview {
    EnvironmentExampleView()
}
