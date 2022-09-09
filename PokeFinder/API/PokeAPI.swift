//
//  PokeAPI.swift
//  PokeDex
//
//  Created by Adam Trafecanty on 3/12/22.
//

import Foundation

let POKEAPI_ROOT = "https://pokeapi.co/api/v2"
let POKEMON_ENDPOINT = "\(POKEAPI_ROOT)/pokemon"

enum PokeAPIError: Error {
    case pokemonNotFound
    case unexpectedAPIError
}

func getPokemon(name: String) async throws -> Pokemon {
    guard let url = URL(string: "\(POKEMON_ENDPOINT)/\(name)") else {
        fatalError("Should never happen, but just in case…URL didn’t work 😔")
    }

    let (data, _) = try await URLSession.shared.data(from: url)
    if let decodedPokemon = try? JSONDecoder().decode(Pokemon.self, from: data) {
        return decodedPokemon
    } else {
        throw PokeAPIError.pokemonNotFound
    }
}




