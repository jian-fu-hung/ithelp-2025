///**
/**

ITHelpDay17
Created by:  Jerry  on 2025/10/2
Copyright (c) 2017 My Company

*/

import SwiftUI
import Combine

class LoginViewModel: ObservableObject {
    // 使用者輸入
    @Published var username: String = ""
    @Published var password: String = ""
        
    // 狀態
    @Published var isLoginEnabled: Bool = false
    @Published var loginMessage: String = ""
        
        
    func login() {
        if username == "admin" && password == "1234" {
            loginMessage = "登入成功"
        } else {
            loginMessage = "帳號或密碼錯誤"
        }
    }
}

