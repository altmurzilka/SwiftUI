//
//  AddPostViewModel.swift
//  BlogApp
//
//  Created by Алтын on 9/9/20.
//

import Foundation

class AddPostViewModel: ObservableObject {
    
    var postTitle: String = ""
    var postBody: String = ""
    
    private var post: Post {
        let post = Post(context: CoreDataManager.shared.moc)
        post.postID = UUID()
        post.title = postTitle
        post.body = postBody
        return post
    }
    
    func savePost() -> Bool {
        
        do {
            try CoreDataManager.shared.savePost(post: post)
            return true
        } catch {
            print(error.localizedDescription)
        }
        return false
        
    }
}
