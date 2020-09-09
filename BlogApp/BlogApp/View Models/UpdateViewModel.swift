//
//  UpdateViewModel.swift
//  BlogApp
//
//  Created by Алтын on 9/9/20.
//

import Foundation

class UpdateViewModel: ObservableObject {
    
    func update(postViewState: PostViewState) {
        
        do {
            try CoreDataManager.shared.updatePost(postID: postViewState.postID, title: postViewState.title, body: postViewState.body)
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct PostViewState {
    var postID: String = ""
    var title: String = ""
    var body: String = ""
}
