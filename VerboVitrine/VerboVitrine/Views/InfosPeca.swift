//
//  InfosPeca.swift
//  VerboVitrine
//
//  Created by Kauane Santana on 10/11/23.
//

import SwiftUI

struct InfosPeca: View {
    @State var nomePeca: String = ""
    @State var preco: Double = 0.0
    @State var tamanho: String = ""
    @State var medidas: String = ""
    @State var avarias: String = ""
    @State var hashtag: String = ""
    
    var body: some View {
        VStack {
            Section(header: Text("Peça")){
                TextField("Insira", text: $nomePeca)
            }
            
            Section(header: Text("Preço")){
                TextField("Insira", value: $preco, format: .number)
            }
            
            Section(header: Text("Tamanho")){
                TextField("Insira", text: $tamanho)
            }
            
            Section(header: Text("Medidas")){
                TextField("Insira", text: $medidas)
            }
            
            Section(header: Text("Avarias")){
                TextField("Insira", text: $avarias)
            }
            
            Section(header: Text("Hashtag")){
                TextField("Insira", text: $hashtag)
            }
            
            Button {
                let itemStruct = Item(id: UUID(), peca: nomePeca, preco: preco, tamanho: tamanho, medidas: medidas, avarias: avarias, hashtags: hashtag)
                
                print(itemStruct)
            } label: {
                Text("Mostrar")
            }
        }
    }
}

#Preview {
    InfosPeca()
}
