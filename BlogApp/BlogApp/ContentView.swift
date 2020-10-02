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
    
    private func deletePost(at indexSet: IndexSet) {
        
        indexSet.forEach { index in
            let post = postListVM.posts[index]
            postListVM.deletePost(post)
        }
    }
    
    var body: some View {
        
        VStack {
            
            List {
                ForEach(postListVM.posts, id: \.postID) { post in
                    NavigationLink(destination: PostDetaiView(post: post)) {
                        Text(post.title)
                    }
                }.onDelete(perform: self.deletePost)
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
