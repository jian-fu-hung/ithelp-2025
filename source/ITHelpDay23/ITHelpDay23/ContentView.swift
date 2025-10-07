///**
/**

ITHelpDay23
Created by:  Jerry  on 2025/10/8
Copyright (c) 2017 My Company

*/

import SwiftUI

struct ContentView: View {
    var body: some View {
            VStack(spacing: 16) {
                Text("hello_message")
                    .font(.title)

                Text("app_title")
                    .font(.headline)

                Button("button_confirm") {
                    print("Button tapped!")
                }
            }
            .padding()
        }
}

#Preview {
    ContentView()
}


#Preview {
    ContentView().environment(\.locale, Locale(identifier: "zh_Hant"))
}

#Preview {
    ContentView().environment(\.locale, Locale(identifier: "en"))
}
