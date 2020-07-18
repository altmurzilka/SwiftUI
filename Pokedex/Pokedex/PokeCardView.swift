//
//  PokeCardView.swift
//  Pokedex
//
//  Created by Алтын on 7/18/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct PokeCardView: View {
    
    let pokemons: [Pokemon] = PokemonGenerator.shared.generatePokemons()
    
    var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 3)
    
    init() {
        UINavigationBar.appearance().barTintColor = UIColor(red: 1, green: 0.345, blue: 0.333, alpha: 1)
        UINavigationBar.appearance().titleTextAttributes = [
            .font : UIFont(name: "Pokemon Solid", size: 20)!,
            .foregroundColor: UIColor.white]
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PokeCardView_Previews: PreviewProvider {
    static var previews: some View {
        PokeCardView()
    }
}
