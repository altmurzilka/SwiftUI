//
//  PostListViewModel.swift
//  BlogApp
//
//  Created by Алтын on 9/8/20.
//

import Foundation

class PostListViewModel: ObservableObject {
    
    @Published var posts = [PostViewModel]()
    
    func fetchAllPosts() {
        DispatchQueue.main.async {
            self.posts = CoreDataManager.shared.getAllPosts().map(PostViewModel.init)
        }
    }
    
}

class PostViewModel {
    
    var post: Post
    
    init(post: Post) {
        self.post = post
    }
    
    var title: String {
        self.post.title ?? ""
    }
    
    var body: String {
        self.post.body ?? ""
    }
    
    var published: Bool {
        self.post.isPublished
    }
    
}
