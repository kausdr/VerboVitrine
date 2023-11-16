//
//  DescBaseView.swift
//  VerboVitrine
//
//  Created by Isabela Bastos Jastrombek on 13/11/23.
//

import SwiftUI

struct DescBaseView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var descricao: String
    
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Label("cancel", systemImage: "xmark")
                        .labelStyle(.iconOnly)
                        .foregroundStyle(Color("bttnColor"))
                        .font(.headline)
                }
                
                Spacer()
                
                Text("Descrição base")
                    .font(.title)
                    .bold()
                
                
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    Label("Done", systemImage: "checkmark")
                        .labelStyle(.iconOnly)
                        .foregroundStyle(Color("bttnColor"))
                        .font(.headline)
                }
//                .disabled(newtitle.isEmpty)
            }
            .padding(32)
            
            ScrollView {
                TextField("Insira a descrição da sua peça", text: $descricao, axis: .vertical)
                    .font(.callout)
                    .padding()
                
                Rectangle()
                    .fill(Color(.systemGray))
                    .frame(height: 0.5)
                    .padding()
            }
            
            
            
        }
    }
}

#Preview {
    DescBaseView(descricao: .constant("uma peça vermelha com bolinhas claras azuis"))
}
