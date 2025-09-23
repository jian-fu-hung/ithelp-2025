//
//  ContentView.swift
//  ITHelpDay9
//
//  Created by 洪建甫 on 2025/9/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, SwiftUI!")
                .font(.title)
                .foregroundColor(.blue)
        }
    }
}

struct ImageExample: View {
    var body: some View {
        VStack {
            Image(systemName: "star.fill") // 系統內建圖示
                .foregroundColor(.yellow)
                .font(.largeTitle)

            Image("anon") // 專案資源內的圖片
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
        }
    }
}

struct ButtonExample: View {
    @State private var showAlert = false
    var body: some View {
        VStack {
            Button("點我一下") {
                showAlert = true
            }.alert("按鈕被點擊！", isPresented: $showAlert, actions: {})
            
            Button(action: {
                print("自訂按鈕")
            }) {
                HStack {
                    Image(systemName: "paperplane.fill")
                    Text("送出")
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
        }
        
    }
}

struct TextFieldExample: View {
    @State private var name: String = ""

    var body: some View {
        VStack {
            TextField("請輸入姓名", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Text("Hello, \(name)")
        }
    }
}

struct ToggleExample: View {
    @State private var isOn = false
    
    var body: some View {
        Toggle("開啟通知", isOn: $isOn)
            .padding()
    }
}

struct ListExample: View {
    let items = ["代辦事項 1", "代辦事項 2", "代辦事項 3"]

    var body: some View {
        List(items, id: \.self) { item in
            Text(item)
        }
    }
}

struct ListExample2: View {

    var body: some View {
        List {
            Section(header: Text("水果")) {
                Text("蘋果")
                Text("香蕉")
            }
            Section(header: Text("飲料")) {
                Text("咖啡")
                Text("奶茶")
            }
        }
    }
}

struct ProgressViewExample: View {
    var body: some View {
        VStack {
            ProgressView("載入中...") // 無限轉圈
            ProgressView(value: 0.5) // 50% 進度條
        }.padding()
    }
}

#Preview {
    ContentView()
}

#Preview {
    ImageExample()
}

#Preview {
    ButtonExample()
}

#Preview {
    TextFieldExample()
}

#Preview {
    ToggleExample()
}

#Preview {
    ListExample()
}

#Preview {
    ListExample2()
}

#Preview {
    ProgressViewExample()
}
