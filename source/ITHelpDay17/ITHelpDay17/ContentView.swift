///**
/**

ITHelpDay17
Created by:  Jerry  on 2025/10/2
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

import SwiftUI
import Combine

class CounterViewModel: ObservableObject {
    // 使用 @Published 讓數值改變時能發出通知
    @Published var count = 0

    func increment() {
        count += 1
    }
}

struct CounterView: View {
    // 使用 @StateObject 讓 View 訂閱 ViewModel 的資料流
    @StateObject var viewModel = CounterViewModel()

    var body: some View {
        VStack {
            Text("目前數字：\(viewModel.count)")
                .font(.largeTitle)
            Button("加一") {
                viewModel.increment()
            }
        }
    }
}

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("帳號", text: $viewModel.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            SecureField("密碼", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Button("登入") {
                viewModel.login()
            }
            .padding()
            
            Text(viewModel.loginMessage)
                .foregroundColor(.blue)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

#Preview {
    CounterView()
}

#Preview {
    LoginView()
}
