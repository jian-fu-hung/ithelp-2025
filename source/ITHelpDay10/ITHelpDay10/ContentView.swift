///**
/**

ITHelpDay10
Created by:  Jerry  on 2025/9/24
Copyright (c) 2017 My Company

*/

import SwiftUI

struct ContentView: View {
    @State private var showAlert = false

    var body: some View {
        Button("顯示警告") {
            showAlert = true
        }
        .alert("提示訊息", isPresented: $showAlert) {
            Button("確定", role: .cancel) {}
            Button("刪除", role: .destructive) {
                print("已刪除")
            }
        } message: {
            Text("這是一個警告框")
        }
    }
}

struct SheetExampleView: View {
    @State private var showSheet = false

    var body: some View {
        Button("打開 Sheet") {
            showSheet = true
        }
        .sheet(isPresented: $showSheet) {
            VStack {
                Text("這是彈出視窗")
                    .font(.title)
                Button("關閉") {
                    showSheet = false
                }
            }
            .padding()
        }
    }
}

struct SheetSingleHeightExampleView: View {
    @State private var showSheet = false
    
    var body: some View {
        Button("打開 Sheet") {
            showSheet = true
        }
        .sheet(isPresented: $showSheet) {
            VStack {
                Text("這是彈出視窗")
                    .font(.title)
                Button("關閉") {
                    showSheet = false
                }
            }
            .padding()
            .presentationDetents([.medium])
        }
    }
}

struct SheetMultiHeightExampleView: View {
    @State private var showSheet = false
    
    var body: some View {
        Button("打開 Sheet") {
            showSheet = true
        }
        .sheet(isPresented: $showSheet) {
            VStack {
                Text("這是彈出視窗")
                    .font(.title)
                Button("關閉") {
                    showSheet = false
                }
            }
            .padding()
            .presentationDetents([.medium, .large, .fraction(0.8), .height(200)])
        }
    }
}

struct FullScreenSheetExampleView: View {
    @State private var showFullScreen = false

    var body: some View {
        Button("全螢幕顯示") {
            showFullScreen = true
        }
        .fullScreenCover(isPresented: $showFullScreen) {
            VStack {
                Text("全螢幕畫面")
                    .font(.largeTitle)
                Button("返回") {
                    showFullScreen = false
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.red)
        }
    }
}

struct ConfirmationDialogExampleView: View {
    @State private var showOptions = false

    var body: some View {
        Button("顯示選單") {
            showOptions = true
        }
        .confirmationDialog("請選擇操作", isPresented: $showOptions, titleVisibility: .visible) {
            Button("相機") { print("開啟相機") }
            Button("相簿") { print("開啟相簿") }
            Button("取消", role: .cancel) {}
        }
    }
}

struct PopoverExampleView: View {
    @State private var showPopover = false

    var body: some View {
        Button("顯示 Popover") {
            showPopover = true
        }
        .popover(isPresented: $showPopover) {
            Text("這是浮動視窗")
                .padding()
        }
    }
}

#Preview {
    ContentView()
}

#Preview {
    SheetExampleView()
}

#Preview {
    SheetSingleHeightExampleView()
}

#Preview {
    SheetMultiHeightExampleView()
}

#Preview {
    FullScreenSheetExampleView()
}

#Preview {
    ConfirmationDialogExampleView()
}

#Preview {
    PopoverExampleView()
}
