//
//  PostListViewModel.swift
//  BlogApp
//
//  Created by Алтын on 9/8/20.
//

import Foundation

class PostListViewModel: ObservableObject {
    
    @Published var posts = [PostViewModel]()
    
    func deletePost(_ postVM: PostViewModel) -> Bool {
        
        var deleted = false
        
        do {
            try CoreDataManager.shared.deletePost(post: postVM.post)
            deleted = true
        } catch {
            print(error.localizedDescription)
        }
        
        return deleted
    }
    
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
    
    var postID: String {
        guard let postID = self.post.postID else {
            return ""
        }
        
        return postID.uuidString
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
