//
//  APIView.swift
//  PokeDex
//
//  Created by Adam Trafecanty on 3/12/22.
//

import SwiftUI


struct APIView: View {
    
    @State public var poke_mon: String = ""
    @State var loading = false
    @State var search = false
    
   var body: some View {
       VStack{
           Image("Pokemon_logo")
               .resizable()
               .scaledToFit()
               .offset(y:-100)
           Text("Pokemon Finder")
               .font(.headline).bold()
               .offset(y:-100)
       
           HStack {
               TextField("Enter a pokemon!", text: $poke_mon)
                   .offset(x:50)

               Button("search") {
                   withAnimation() {
                       search = true
                   }
               }
               .offset(x:-100)
           }
       }
       .task(id: poke_mon) {
           search = false
       }
           if search {
        
                   PokemonView(pokename: poke_mon)
               
           }
       }
   }

 
struct PokeAPIView_Previews: PreviewProvider {
    static var previews: some View {
        APIView()
    }
}


