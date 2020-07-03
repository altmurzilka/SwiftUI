//
//  SenderView.swift
//  Developers
//
//  Created by алтынпончик on 7/3/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct SenderView: View {
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presen
    
    @State var username = ""
    @State var description = ""
    @State var image : Data = .init(count: 0)
    @State var favos = false
    @State var loved = false
    
    @State var show = false
    
    var body: some View {
        NavigationView {
            VStack (spacing: 14) {
                ZStack {
                    if image.count != 0 {
                        Button(action: {
                            self.show.toggle()
                        }) {
                            Image(uiImage: UIImage(data: self.image)!)
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 85, height: 85)
                                .clipShape(Circle())
                        }
                    } else {
                        Button(action: {
                            self.show.toggle()
                        }) {
                            Image(systemName: "person.circle.fill")
                                .font(.largeTitle)
                        }
                    }
                    Button(action: {
                        self.favos.toggle()
                    }) {
                        Image(systemName: self.favos ? "star.fill" : "star")
                            .foregroundColor((self.favos == true) ? Color.yellow : Color.gray)
                    }.offset(x: 40, y: 10)
                }
                
                TextField("Username...", text: self.$username)
                    .padding()
                    .background(Color(red : 233.0/255, green: 234.0/255, blue: 243.0/255))
                    .cornerRadius(20)
                
                TextField("Description...", text: self.$description)
                    .padding()
                    .background(Color(red : 233.0/255, green: 234.0/255, blue: 243.0/255))
                    .cornerRadius(20)
                
                Button(action: {
                    let send = Developer(context: self.moc)
                    send.username = self.username
                    send.desription = self.description
                    send.favo = self.favos
                    send.imageD = self.image
                    
                    try? self.moc.save()
                    
                    self.username = ""
                    self.description = ""
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

struct SenderView_Previews: PreviewProvider {
    static var previews: some View {
        SenderView()
    }
}

//struct TabBar : View {
//    var body: some View {
//        TabView {
//            ContentView()
//                .tabItem {
//                    Image(systemName: "house.fill")
//                    Text("Home")
//            }.tag(0)
//            FavsView()
//                .tabItem {
//                    Image(systemName: "star.fill")
//                    Text("Favorite")
//            }.tag(1)
//        }
//    }
//}
//
//struct FavsView : View {
//    @Environment(\.managedObjectContext) var moc
//
//    @FetchRequest(entity: Developer.entity(), sortDescriptors: [
//        NSSortDescriptor(keyPath: \Developer.favo, ascending: true)])
//    var favos : FetchedResults<Developer>
//    var body: some View {
//        NavigationView {
//            Text("")
//        }
//    }
//}
