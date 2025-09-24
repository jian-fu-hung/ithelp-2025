///**
/**

ITHelpDay11
Created by:  Jerry  on 2025/9/24
Copyright (c) 2017 My Company

*/

import SwiftUI

struct ContentView: View {
    @State private var count = 0  // 狀態變數

    var body: some View {
        VStack {
            Text("目前數字：\(count)")
                .font(.title)

            Button("加一") {
                count += 1
            }
            .padding()
        }
    }
}

struct BindingExampleView: View {

    @State private var name = "" // 使用者輸入的名字
    @State private var isLoggedIn = false  // 紀錄是否登入

    var body: some View {
        VStack {
            TextField("輸入名字", text: $name)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("登入") {
                if !name.isEmpty {
                    isLoggedIn = true
                } else {
                    isLoggedIn = false
                }
            }
            if isLoggedIn && !name.isEmpty {
                ChildView(name: $name, isLoggedIn: $isLoggedIn) // 傳給子元件
            }
        }
    }
}

struct ChildView: View {
    @Binding var name: String  // 接收父元件的狀態
    @Binding var isLoggedIn: Bool

    var body: some View {
        VStack {
            Text("歡迎 \(name)")
            Button("登出") {
                isLoggedIn = false
                name = ""
            }
        }
    }
}



#Preview {
    ContentView()
}

#Preview {
    BindingExampleView()
}
