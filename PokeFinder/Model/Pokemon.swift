//
//  Pokemon.swift
//  PokeDex2
//
//  Created by Adam Trafecanty on 3/13/22.
//

import Foundation

// Note: Both of these structs are only subsets of the API’s returned values.
struct Pokemon: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var sprites: Sprites
    var height: Int
    var weight: Int
    var types: [poketypes]
    
  

    struct Sprites: Hashable, Codable {
        // These images aren’t always available so are defined as optional.
        var front_default: String?
    }
    
    
    struct poketypes: Hashable, Codable {
        var type: poketype
        
        struct poketype: Hashable, Codable {
            var name: String
        }
    }
    
}
// For this demo, we use this struct solely for figuring out how many items are
// in a resource. It can definitely be expanded to do more.
struct PokeAPIPage: Hashable, Codable {
    var count: Int
}
