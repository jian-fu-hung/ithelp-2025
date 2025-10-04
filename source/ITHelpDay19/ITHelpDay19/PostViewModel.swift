///**
/**

ITHelpDay19
Created by:  Jerry  on 2025/10/4
Copyright (c) 2017 My Company

*/

import Foundation

@MainActor
class PostViewModel: ObservableObject {
    @Published var posts: [Post] = []
    private let service = PostService()
    
    func loadPosts() async {
        do {
            posts = try await service.fetchPosts()
        } catch {
            print("載入失敗：\(error)")
        }
    }
}
