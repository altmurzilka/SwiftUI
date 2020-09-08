//
//  ContentView.swift
//  BlogApp
//
//  Created by Алтын on 9/8/20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var postListVM = PostListViewModel()
    var body: some View {
        
        List(postListVM.posts, id: \.title) { post in
            Text(post.title)
        }
        
        .onAppear {
            self.postListVM.fetchAllPosts()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
