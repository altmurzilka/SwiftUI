//
//  ContentView.swift
//  Pokedex
//
//  Created by алтынпончик on 7/4/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    //let col1 = UIColor(red: 1, green: 0.345, blue: 0.333, alpha: 1)
    
    init() {
        UINavigationBar.appearance().barTintColor = UIColor(red: 1, green: 0.345, blue: 0.333, alpha: 1)
        UINavigationBar.appearance().titleTextAttributes = [
            .font : UIFont(name: "Pokemon Solid", size: 20)!,
            .foregroundColor: UIColor.white]
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("bg")
                    List() {
                        ForEach(0..<8) { _ in
                            HStack {
                                ForEach(0..<3) { _ in
                                    Image("orange_color")
                                        .resizable()
                                        .scaledToFit()
                                }
                            }
                        }
                    }
            }
            .navigationBarTitle(Text("Pokemon"), displayMode: .inline)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





