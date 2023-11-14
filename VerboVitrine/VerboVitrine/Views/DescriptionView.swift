//
//  DescriptionView.swift
//  VerboVitrine
//
//  Created by Laura Machado Isolani on 13/11/23.
//

import SwiftUI

struct DescriptionView: View {
    
    @State var nomePeca: String = ""
    private let pastboard = UIPasteboard.general
    
    var body: some View {
        
        HStack {
            Text("**Peça:** Suéter Coreano estampado cinza claro com detalhes em bordô")
                .frame(width: 238)
                .font(.title3)
            
            Spacer()
            
            Button{
                pastboard.string = "This Text Copied to Clipboard"
            } label: {
                
                Image(systemName: "doc.on.doc")
                    .font(.system(size: 14))
                    .foregroundStyle(Color("txtBttnColor"))
                    .padding()
            }
            .background(Color("bttnColor"))
            .cornerRadius(14)
            .padding()
        }
        
        Divider()
        VStack{
            
            
            Text("**@brecho** Suéter Coreano estampado cinza claro com detalhes em bordô Peça em acrílico, macio ao toque e em perfeito estado! Tamanho M por R$65,00 \n\nMedidas: busto: 120-140 cm \ncomprimento: 65 cm \nombro: 52 cm \nmanga: 64 cm \n\n✰Primeira pessoa a comentar quero ou mandar mensagem leva a peça.  \n\n✰Pagamentos via pix, crédito ou débito (acréscimo de taxa da maquininha para as opções no cartão) \n\n✰Envios para todo o Brasil. \n\nChama no inbox para mais informações!#brecho #brechoonline #brechovirtual #brechopr #brechocuritiba")
                .font(.callout)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.bttn, lineWidth: 1)
                ).padding()
            
            Button {
                
            } label: {
                
                Text("Refazer legenda")
                    .foregroundStyle(.bttn)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.bttn, lineWidth: 1)
                    ).padding()
            }
            
            Divider()
            
            
            Button {
                
            } label: {
                HStack {
                    Image(systemName: "plus")
                        .foregroundStyle(Color(.systemGray))
                        .bold()
                    
                    Text("Nova peça")
                        .foregroundStyle(Color(.systemGray))
                        .bold()
                }
                .padding()
            }
        }
    }
}

#Preview {
    DescriptionView()
}
