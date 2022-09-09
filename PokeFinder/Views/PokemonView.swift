//
//  PokemonView.swift
//  PokeDex2
//
//  Created by Adam Trafecanty on 3/13/22.
//

import SwiftUI

struct PokemonView: View {
    
    @State var loading = false
    @State var pokemon: Pokemon?
    @State var name = ""
    @State var heightAsString = ""
    @State var weightAsString = ""
    @State var type = ""
    
    var pokename: String
    
    var body: some View {
        VStack {
            if loading {
                ProgressView()
            } else if name == "" {
                Text("Oops! Pokemon not found")
                    .font(.system(size:20)).italic()
                Image("sad_pokemon")
            } else {
                Text(name.uppercased())
                    .font(.system(size:50))
                    .font(.headline).bold()
                    .padding()
            
                PokeImage(imageUrl: pokemon?.sprites.front_default ?? "")
                            .padding()
    
                    
               
                Text("Height:  \(heightAsString) meter(s)")
                    .font(.system(size:20)).italic()
                Text("Weight: \(weightAsString) kilogram(s)")
                    .font(.system(size:20)).italic()
                Text("Type: \(type)")
                    .font(.system(size:20)).italic()
            }
        }
        .task(id: pokename) {
            await searchPokemon()
        }
    }

    func searchPokemon() async {
        do {
            loading = true
            let loadedPokemon = try await getPokemon(name: pokename.lowercased())
            pokemon = loadedPokemon
            name = pokemon?.name ?? ""
            
            let typeArray = pokemon?.types ?? nil
            let currentType = typeArray?[0].type
            let typeName = currentType?.name
            type = typeName ?? ""
            heightAsString = String(pokemon?.height ?? 0)
            weightAsString = String(pokemon?.weight ?? 0)
            
            
        }
        catch{
            
        }
        loading = false
       
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PokemonView(pokename: "snorlax")
        }
    }
}
