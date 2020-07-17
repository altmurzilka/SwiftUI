//
//  ContentView.swift
//  Pokedex
//
//  Created by алтынпончик on 7/4/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let pokemons: [Pokemon] = PokemonGenerator.shared.generatePokemons()
    
    var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 3)
    
    init() {
        UINavigationBar.appearance().barTintColor = UIColor(red: 1, green: 0.345, blue: 0.333, alpha: 1)
        UINavigationBar.appearance().titleTextAttributes = [
            .font : UIFont(name: "Pokemon Solid", size: 20)!,
            .foregroundColor: UIColor.white]
    }
    
    var body: some View {
        NavigationView {
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(self.pokemons) { pokemon in
                    VStack {
                        Image("\(pokemon.id)").resizable().frame(width: 40, height: 40)
                        Text("\(pokemon.pokemonName)")
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







