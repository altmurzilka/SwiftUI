//
//  SenderView.swift
//  Glue
//
//  Created by алтынпончик on 7/3/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct SenderView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presen
    
    @State var author = ""
    @State var msg = ""
    @State var image : Data = .init(count: 0)
    
    @State var date = ""
    @State var time = ""
    
    @State private var show = false
    
    var body: some View {
        NavigationView {
            VStack (spacing: 14) {
                TextField("Username", text: self.$author)
                    .padding()
                    .background(Color(red : 233.0/255, green: 234.0/255, blue: 243.0/255))
                    .cornerRadius(20)
                
                TextView(placeholderText: "Description", text: self.$msg).frame(numLines: 15)
                
                Button(action: {
                    let send = NewModel(context: self.moc)
                    
                    send.author = self.author
                    send.msg = self.msg
                    
                    let format = DateFormatter()
                    format.dateFormat = "dd MMM"
                    send.day = format.string(self.date)
                    format.dateFormat = "hh:mm"
                    let time = format.string(from: date)
                    
                    send.day = self.date
                    send.time = self.time
                    
                    try? self.moc.save()
                    
                    self.author = ""
                    self.msg = ""
                    self.presen.wrappedValue.dismiss()
                }) {
                    Text("Add")
                }
            }.padding()
                .navigationBarItems(trailing: Button(action: {
                    self.presen.wrappedValue.dismiss()
                }) {
                    Text("Cancel")
                })
        }
    }
}

struct SenderView_Previews: PreviewProvider {
    static var previews: some View {
        SenderView()
    }
}
