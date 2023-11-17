//
//  IntroView.swift
//  VerboVitrine
//
//  Created by Kauane Santana on 16/11/23.
//

import SwiftUI

struct IntroView: View {
    
//    @Binding var nomePeca: String
//    @Binding var descricao: String
//    @Binding var preco: Double
//    @Binding var tamanho: String
//    @Binding var medidas: String
//    @Binding var avarias: String
//    @Binding var hashtag: String
    
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("LogoDark")
                .resizable()
                .frame(width: 55, height: 25)
            
            Spacer()
                .frame(height: 221)
            
            VStack (spacing: 11) {
                Rectangle()
                    .fill(Color(.systemGray5))
                    .frame(height: 92)
                
                Rectangle()
                    .fill(Color(.systemGray5))
                    .frame(height: 92)
                
                Rectangle()
                    .fill(Color(.systemGray5))
                    .frame(height: 92)
            }
            .padding(.horizontal)
            
            Rectangle()
                .fill(Color(.systemGray))
                .frame(height: 0.5)
                .padding()
            
            NavigationLink {
                InfosPeca()
            } label: {
                HStack {
                    Image(systemName: "plus")
                        .foregroundStyle(Color(.systemGray))
                        .bold()
                    
                    Text("Descrever do meu jeito")
                        .foregroundStyle(Color(.systemGray))
                        .bold()
                }
                .padding()
            }
            .frame(maxWidth: .infinity)
        
    }
        .navigationBarBackButtonHidden()
        }
}

#Preview {
    IntroView()
}
