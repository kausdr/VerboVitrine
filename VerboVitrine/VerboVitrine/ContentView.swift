//
//  ContentView.swift
//  VerboVitrine
//
//  Created by Kauane Santana on 07/11/23.
//

import SwiftUI

struct ContentView: View {
    @State var mensagem: String = ""
    var body: some View {
        ZStack {
            Form {
                Section("Escreva algo:") {
                    TextField("mensagem para o chatgpt", text: $mensagem)
                }
                
                
            }
            
            VStack {
                Spacer()
                Button {
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(height: 50)
                            .padding()
                        Text("Gerar")
                            .foregroundStyle(.white)
                    }
                }
                
                Text("Texto chatgpteco")
                Spacer()
            }
        }
        
        
    }
}

#Preview {
    ContentView(mensagem: "")
}
