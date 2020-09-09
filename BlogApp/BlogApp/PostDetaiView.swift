//
//  PostDetaiView.swift
//  BlogApp
//
//  Created by Алтын on 9/9/20.
//

import SwiftUI

struct PostDetaiView: View {
    
    let post: PostViewModel
    @ObservedObject private var updateVM = UpdateViewModel()
    @State private var postViewState = PostViewState()
    
    var body: some View {
        VStack {
            TextField(post.title, text: $postViewState.title)
            TextField(post.body, text: $postViewState.body)
            
            Button("Update") {
                self.postViewState.postID = self.post.postID
                self.updateVM.update(postViewState: self.postViewState)
            }
            .onAppear {
                self.postViewState.title = self.post.title
                self.postViewState.body = self.post.body
            }
        }
    }
}

struct PostDetaiView_Previews: PreviewProvider {
    static var previews: some View {
        
        let post = Post()
        return PostDetaiView(post: PostViewModel(post: post))
    }
}
