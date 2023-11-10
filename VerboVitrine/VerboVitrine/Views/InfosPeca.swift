//
//  InfosPeca.swift
//  VerboVitrine
//
//  Created by Kauane Santana on 10/11/23.
//

import SwiftUI

struct InfosPeca: View {
    
    @State var nomePeca: String = "Camisa Vermelha"
    
    var body: some View {
        VStack {
            VStack {
                Section(header: Text("Peça")){
                    TextField("Insira", text: $nomePeca)
                }
            }
            
            VStack {
                Text("Preço")
                Text("Tamanho")
                Text("Medidas")
            }
            
            VStack {
                
            }
            
            VStack {
                
            }
        }
    }
}

#Preview {
    InfosPeca()
}
