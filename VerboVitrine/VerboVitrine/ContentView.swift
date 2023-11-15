//
//  ContentView.swift
//  VerboVitrine
//
//  Created by Kauane Santana on 07/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var nomePeca: String = ""
    @State var descricao: String = ""
    @State var preco: Double = 0.0
    @State var tamanho: String = ""
    @State var medidas: String = ""
    @State var avarias: String = ""
    @State var hashtag: String = ""
    
    
    var body: some View {
        InfosPeca(nomePeca: $nomePeca, descricao: $descricao, preco: $preco, tamanho: $tamanho, medidas: $medidas, avarias: $avarias, hashtag: $hashtag)
    }
}

#Preview {
    ContentView()
}
