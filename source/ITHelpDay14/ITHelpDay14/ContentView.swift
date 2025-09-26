///**
/**

ITHelpDay14
Created by:  Jerry  on 2025/9/27
Copyright (c) 2017 My Company

*/

import SwiftUI

final class Router: ObservableObject {
    @Published var path = NavigationPath()
}

struct ContentView: View {
    @EnvironmentObject var router: Router

        var body: some View {
            NavigationStack(path: $router.path) {
                VStack {
                    Button("前往詳細頁") {
                        router.path.append("Detail")
                    }
                    Button("前往搜尋頁") {
                        router.path.append("Search")
                    }
                    Button("Go to Detail 2") {
                        router.path.append(2) // Can append different types
                    }
                    Button("登出") {
                        router.path.append(false)
                    }
                }
                .navigationDestination(for: String.self) { value in
                    if value == "Detail" {
                        DetailView()
                    } else if value == "Search" {
                        SearchView()
                    }
                }
                .navigationDestination(for: Int.self) { detailInt in
                                Text("Detail View for number: \(detailInt)")
                                    .navigationTitle("Number Detail")
                            }
                .navigationDestination(for: Bool.self) { value in
                    Text("登出成功")
                }
                .navigationTitle("首頁")
            }.environmentObject(router)
        }
}

struct DetailView: View {
    @EnvironmentObject var router: Router
    var body: some View {
        VStack {
            Text("這是詳細頁")
                .navigationTitle("詳細資料")
            Button("返回上一頁") {
                router.path.removeLast()
            }
        }

    }
}

struct SearchView: View {
    @EnvironmentObject var router: Router
    var body: some View {
        VStack {
            Text("這是搜尋頁")
                .navigationTitle("搜尋資料")
            Button("返回首頁") {
                router.path = .init()
            }
        }
        
    }
}

struct TabRootView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("首頁", systemImage: "house.fill")
                }

            SearchView()
                .tabItem {
                    Label("搜尋", systemImage: "magnifyingglass")
                }

            ProfileView()
                .tabItem {
                    Label("我的", systemImage: "person.fill")
                }
        }
    }
}

struct ProfileView: View {
    var body: some View {
        Text("這是個人頁面")
            .navigationTitle("我的資料")
    }
}

#Preview {
    ContentView().environmentObject(Router())
}

#Preview {
    TabRootView().environmentObject(Router())
}
