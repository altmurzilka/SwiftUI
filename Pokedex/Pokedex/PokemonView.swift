//
//  PokemonView.swift
//  Pokedex
//
//  Created by Алтын on 7/18/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct PokemonView: View {
    
    let pokemon : Pokemon
    
    var body: some View {
        VStack {
            Image("\(self.pokemon.id)")
            Text(self.pokemon.pokemonName)
            Text("\(self.pokemon.height)")
            Text("\(self.pokemon.weight)")
        }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static let pokemons: [Pokemon] = PokemonGenerator.shared.generatePokemons()
    static var previews: some View {
        PokemonView(pokemon: Pokemon(id: 1, pokemonName: "bulbasaur", baseExp: 64, height: 7, weight: 69))
    }
}
