///**
/**

ITHelpDay19
Created by:  Jerry  on 2025/10/4
Copyright (c) 2017 My Company

*/

import Alamofire

class PostService {
    func fetchPosts() async throws -> [Post] {
        let url = "https://jsonplaceholder.typicode.com/posts"
        return try await AF.request(url)
            .serializingDecodable([Post].self)
            .value
    }
}
