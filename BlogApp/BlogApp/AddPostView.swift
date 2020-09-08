//
//  AddPostView.swift
//  BlogApp
//
//  Created by Алтын on 9/9/20.
//

import SwiftUI

struct AddPostView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var addPostVM = AddPostViewModel()
    
    var body: some View {
        VStack {
            TextField("Title", text: $addPostVM.postTitle)
            TextField("Body", text: $addPostVM.postBody)
            Button("Save") {
                let saved = self.addPostVM.savePost()
                if saved {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        }.padding()
    }
}

struct AddPostView_Previews: PreviewProvider {
    static var previews: some View {
        AddPostView()
    }
}
