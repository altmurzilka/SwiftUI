//
//  ContentView.swift
//  BlogApp
//
//  Created by Алтын on 9/8/20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var postListVM = PostListViewModel()
    @State private var isPresented: Bool = false
    
    var body: some View {
        
        VStack {
            
            List(postListVM.posts, id: \.title) { post in
                Text(post.title)
            }
            .onAppear {
                self.postListVM.fetchAllPosts()
            }
            
            .sheet(isPresented: $isPresented, onDismiss: {
                self.postListVM.fetchAllPosts()
            }) {
                AddPostView()
            }
            
        }
        .navigationBarTitle("Posts")
        .navigationBarItems(trailing: Button("Add Post") {
            self.isPresented = true
        })
        .embedInNavigationView()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
