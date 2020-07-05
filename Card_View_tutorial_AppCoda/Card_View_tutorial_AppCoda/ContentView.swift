//
//  ContentView.swift
//  Card_View_tutorial_AppCoda
//
//  Created by алтынпончик on 5/17/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct TodoItem: Identifiable {
   var id = UUID()
   var action: String
}

struct ContentView: View {
    
   var todoItems: [TodoItem] = [
         TodoItem(action: "Writing Swift"),
         TodoItem(action: "Writing SwiftUI")
      ]
       
      var body: some View {
         NavigationView {
            List(todoItems) { todoItem in
               NavigationLink(destination: TodoDetailView(todoItem: todoItem)) {
                  Text(todoItem.action)
               }
            }.navigationBarTitle(Text("Todo Items"))
         }
      }
   }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TodoDetailView: View {
   var todoItem: TodoItem
   var body: some View {
      Text(todoItem.action)
   }
}


