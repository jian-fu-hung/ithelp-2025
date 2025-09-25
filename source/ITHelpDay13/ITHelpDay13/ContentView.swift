///**
/**

ITHelpDay13
Created by:  Jerry  on 2025/9/26
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

struct ScrollViewExample: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                ForEach(1..<50) { i in
                    Text("項目 \(i)")
                        .padding()
                }
            }
        }
    }
}

struct LazyVStackExample: View {
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack {
                ForEach(1..<50) { i in
                    Text("項目 \(i)")
                        .padding()
                }
            }
        }
    }
}

struct LazyHStackExample: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 8) {
                ForEach(1..<50) { i in
                    VStack(alignment: .leading) {
                        Image(systemName: "square.and.arrow.up")
                            .resizable()
                            .frame(width: 44, height: 44)
                        Text("項目 \(i)")
                    }
                }
            }
        }
    }
}


struct LazyVGridExample: View {
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(1..<50) { i in
                    Text("項目 \(i)")
                        .frame(height: 50)
                        .background(Color.blue.opacity(0.2))
                }
            }
        }
    }
}

struct LazyHGridExample: View {
    let rows = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows) {
                ForEach(1..<50) { i in
                    Text("項目 \(i)")
                        .frame(width: 100)
                        .background(Color.green.opacity(0.2))
                }
            }
        }
    }
}


#Preview {
    ContentView()
}

#Preview {
    ScrollViewExample()
}

#Preview {
    LazyVStackExample()
}

#Preview {
    LazyHStackExample()
}

#Preview {
    LazyVGridExample()
}

#Preview {
    LazyHGridExample()
}
