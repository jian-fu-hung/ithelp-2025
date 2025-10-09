///**
/**

ITHelpDay24
Created by:  Jerry  on 2025/10/9
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
                .foregroundColor(Color("BrandColor"))
        }
        .padding()
    }
}

struct ThemeSwitcherView: View {
    @AppStorage("themeMode") private var themeMode: String = "system"

    var body: some View {
        VStack(spacing: 20) {
            Text("主題模式")
                .font(.title)
                .foregroundColor(Color("BrandColor"))
                .bold()

            Picker("外觀", selection: $themeMode) {
                Text("跟隨系統").tag("system")
                Text("淺色模式").tag("light")
                Text("深色模式")
                    .tag("dark")
            }
            .pickerStyle(.segmented)
        }
        .padding()
        .preferredColorScheme(currentScheme)
    }

    private var currentScheme: ColorScheme? {
        switch themeMode {
        case "light": return .light
        case "dark": return .dark
        default: return nil
        }
    }
}


#Preview {
    ContentView()
}

#Preview("Dark Mode") {
    ContentView()
        .preferredColorScheme(.dark)
}

#Preview("Light Mode") {
    ContentView()
        .preferredColorScheme(.light)
}

#Preview("ThemeSwitcherView") {
    ThemeSwitcherView()
}
