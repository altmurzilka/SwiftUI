//
//  ContentView.swift
//  Glue
//
//  Created by алтынпончик on 7/3/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(entity: NewModel.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \NewModel.id, ascending: true),
        NSSortDescriptor(keyPath: \NewModel.time, ascending: false),
        NSSortDescriptor(keyPath: \NewModel.msg, ascending: true),
        NSSortDescriptor(keyPath: \NewModel.day, ascending: false),
        NSSortDescriptor(keyPath: \NewModel.author, ascending: true),
        NSSortDescriptor(keyPath: \NewModel.image, ascending: true),
    ]) var developers: FetchedResults<NewModel>
    
    @State var image : Data = .init(count: 0)
    @State var show = false
    @State var showImage = false
    
    var body: some View {
        
        ZStack{
            
            Color.black.edgesIgnoringSafeArea(.bottom)
            
            VStack{
                
                VStack(spacing : 5){
                    
                    HStack{
                        HStack {
                            Button(action: {
                                self.show.toggle()
                            }) {
                                VStack(alignment: .leading, spacing: 0.0) {
                                    Image("mascot_swift-badge").resizable()
                                        .frame(width: 50, height: 50)
                                    Text("Create Text Post")
                                }.padding(.top, 15)
                            }.buttonStyle(PlainButtonStyle())
                            .sheet(isPresented: self.$show) {
                                    SenderView().environment(\.managedObjectContext, self.moc)
                            }
                        }
                        Spacer()
                        
                        Text("Home").font(.body).foregroundColor(Color.white)
                        
                        Spacer()
                        
                        HStack {
                            Button(action: {
                                self.showImage.toggle()
                                
                            }) {
                                VStack {
                                    Text("Create Image Post").padding(.top, 65)
                                }
                            } .buttonStyle(PlainButtonStyle())
                            .sheet(isPresented: self.$showImage) {
                                    SenderImageView().environment(\.managedObjectContext, self.moc)
                            }
                        }
                        
                    }.padding([.leading,.trailing], 15)
                        .padding(.top, 10)
                        .foregroundColor(Color.blue)
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 10){
                        
                        ForEach(developers, id: \.self) { dev in
                            HStack {
                                Image(uiImage: UIImage(data: dev.image ?? self.image)!)
                                    .resizable()
                                    .frame(width: 85, height: 85)
                                
                                VStack (alignment: .leading) {
                                    Text("\(dev.author ?? "")")
                                        .bold()
                                        .font(.headline)
                                    Text("\(dev.msg ?? "")")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                            }
                        }
                    }.padding()
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
