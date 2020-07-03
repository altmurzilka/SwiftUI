//
//  ContentView.swift
//  Developers
//
//  Created by алтынпончик on 7/3/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(entity: Developer.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Developer.username, ascending: true),
        NSSortDescriptor(keyPath: \Developer.desription, ascending: true),
        NSSortDescriptor(keyPath: \Developer.favo, ascending: false),
        NSSortDescriptor(keyPath: \Developer.loved, ascending: false),
        NSSortDescriptor(keyPath: \Developer.imageD, ascending: true),
    ]) var developers: FetchedResults<Developer>
    
    @State var image : Data = .init(count: 0)
    @State var show = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(developers, id: \.self) { dev in
                    HStack {
                        Image(uiImage: UIImage(data: dev.imageD ?? self.image)!)
                            .resizable()
                            .frame(width: 85, height: 85)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                        
                        VStack (alignment: .leading) {
                            Text("\(dev.username ?? "")")
                                .bold()
                                .font(.headline)
                            Text("\(dev.desription ?? "")")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Image(systemName: dev.favo ? "star.fill" : "star")
                            .foregroundColor((dev.favo == true) ? Color.yellow : Color.gray)
                    }
                }
            }.navigationBarTitle("Developers", displayMode: .inline)
                .navigationBarItems(leading: Button(action: {
                    self.show.toggle()
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Create new")
                    }
                })
        }
        .sheet(isPresented: self.$show) {
            SenderView().environment(\.managedObjectContext, self.moc)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
