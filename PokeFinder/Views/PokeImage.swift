//
//  PokeImage.swift
//  PokeDex
//
//  Created by Adam Trafecanty on 3/12/22.
//
import SwiftUI

struct PokeImage: View {
    let imageDimension: CGFloat = 96.0 // Dictated by the API.
    var imageUrl: String

    var body: some View {
        AsyncImage(url: URL(string: imageUrl)) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            
        } placeholder: {
            ProgressView()
        }.frame(
            width: imageDimension, height: imageDimension, alignment: .center
        )
    }
}

struct PokeAPIImage_Previews: PreviewProvider {
    static var previews: some View {
        PokeImage(imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/728.png")
    }
}
