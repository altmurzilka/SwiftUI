//
//  SenderImageView.swift
//  Glue
//
//  Created by алтынпончик on 7/3/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct SenderImageView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presen
    
    @State var author = ""
    @State var msg = ""
    @State var image : Data = .init(count: 0)
    
    @State private var show = false
    
    var body: some View {
        NavigationView {
            VStack (spacing: 14) {
                HStack {
                    if image.count != 0 {
                        Button(action: {
                            self.show.toggle()
                        }) {
                            Image(uiImage: UIImage(data: self.image)!)
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 85, height: 85)
                        }
                    } else {
                        Button(action: {
                            self.show.toggle()
                        }) {
                            Image(systemName: "camera.fill")
                                .font(.largeTitle)
                        }
                    }
                    
                    TextField("Username...", text: self.$author)
                        .padding()
                        .background(Color(red : 233.0/255, green: 234.0/255, blue: 243.0/255))
                        .cornerRadius(20)
                }
                
                TextView(placeholderText: "Description", text: self.$msg).frame(numLines: 15)
                
                Button(action: {
                    let send = NewModel(context: self.moc)
                    send.author = self.author
                    send.msg = self.msg
                    send.image = self.image
                    
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
        .sheet(isPresented: self.$show, content: {
            ImagePicker(show: self.$show, image: self.$image)
        })
    }
}

struct SenderImageView_Previews: PreviewProvider {
    static var previews: some View {
        SenderImageView()
    }
}
