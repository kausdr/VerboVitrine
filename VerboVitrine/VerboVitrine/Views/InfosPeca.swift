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
    
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        formatter.zeroSymbol  = ""
        return formatter
    }()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            
            ///
            
            Text("Peça #1:")
                .font(.title3)
                .bold()
            
            TextField("Nome da peça...", text: $nomePeca)
                .padding(.horizontal, 16)
            
            Rectangle()
                .fill(Color(.systemGray))
                .frame(height: 0.5)
                .padding(.horizontal, 16)

            ///
            
            HStack(spacing: 4) {
                Image(systemName: "dollarsign.square")
                    .font(.system(size: 14))
                
                Text("Preço")
                    .font(.body)
                    .bold()
            }
            
            TextField("Insira", value: $preco, formatter: numberFormatter)
                .keyboardType(.numbersAndPunctuation)
                .padding(.horizontal, 16)
            
            Rectangle()
                .fill(Color(.systemGray))
                .frame(height: 0.5)
                .padding(.horizontal, 16)
            
            ///
            
            HStack(spacing: 4) {
                Image(systemName: "textformat.size")
                    .font(.system(size: 14))
                
                Text("Tamanho")
                    .font(.body)
                    .bold()
            }
            
            TextField("Insira", text: $tamanho)
                .padding(.horizontal, 16)
            
            Rectangle()
                .fill(Color(.systemGray))
                .frame(height: 0.5)
                .padding(.horizontal, 16)
            
            ///
            
            HStack(spacing: 4) {
                Image(systemName: "scissors")
                    .font(.system(size: 14))
                
                Text("Avarias")
                    .font(.body)
                    .bold()
            }
            
            TextField("Text...", text: $avarias)
                .padding(.horizontal, 16)
            
            Rectangle()
                .fill(Color(.systemGray))
                .frame(height: 0.5)
                .padding(.horizontal, 16)
            
            ///
            
            HStack(spacing: 4) {
                Image(systemName: "ruler")
                    .font(.system(size: 14))
                
                Text("Medidas")
                    .font(.body)
                    .bold()
            }
            
            TextField("Nenhuma medida", text: $avarias)
//                .padding(.horizontal, 16)
            
            Spacer()
            
            ///
            
            HStack(spacing: 4) {
                Image(systemName: "number.circle")
                    .font(.system(size: 20))
                
                Text("Hashtag")
                    .font(.body)
                    .bold()
            }
            
            Rectangle()
                .fill(Color(.systemGray))
                .frame(height: 0.5)
            
            ///
            
            
            HStack(spacing: 4) {
                Image(systemName: "pencil.circle")
                    .font(.system(size: 20))
                
                Text("Descrição base")
                    .font(.body)
                    .bold()
            }
            
            Rectangle()
                .fill(Color(.systemGray))
                .frame(height: 0.5)
            
            ///
            
            HStack {
                Image(systemName: "trash")
                    .bold()
                    .foregroundStyle(Color(uiColor: .systemGray))
                
                Spacer()
                
                Button {
                    let itemStruct = Item(id: UUID(), peca: nomePeca, preco: preco, tamanho: tamanho, medidas: medidas, avarias: avarias, hashtags: hashtag)
                    
                    print(itemStruct)
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 14)
                            .fill(nomePeca == "" ? Color(uiColor: .clear) : .black)
                            .strokeBorder(nomePeca == "" ? Color(uiColor: .systemGray) : Color(uiColor: .clear))
                        
                        Text("Gerar")
                            .foregroundStyle(nomePeca == "" ? Color(uiColor: .systemGray) : .white)
                        
                        
                    }
                    .frame(width: 86 ,height: 48)
                }
            }
        }
        .padding(24)
    }
}

#Preview {
    InfosPeca()
}
