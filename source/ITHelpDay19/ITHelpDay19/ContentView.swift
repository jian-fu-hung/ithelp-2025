///**
/**

ITHelpDay19
Created by:  Jerry  on 2025/10/4
Copyright (c) 2017 My Company

*/

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = PostViewModel()
        
        var body: some View {
            NavigationView {
                List(viewModel.posts) { post in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(post.title)
                            .font(.headline)
                        Text(post.body)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical, 4)
                }
                .navigationTitle("文章列表")
                .task {
                    await viewModel.loadPosts()
                }
            }
        }
}

#Preview {
    ContentView()
}
