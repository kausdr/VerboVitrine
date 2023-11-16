//
//  DescriptionView.swift
//  VerboVitrine
//
//  Created by Laura Machado Isolani on 13/11/23.
//

import SwiftUI

struct DescriptionView: View {
    @ObservedObject var viewModel = ViewModel()
    
    
    @Binding var nomePeca: String
    @Binding var descricao: String
    @Binding var preco: Double
    @Binding var tamanho: String
    @Binding var medidas: String
    @Binding var avarias: String
    @Binding var hashtag: String
    @State var ultimasMsg: [String] = []
    @State var itemStruct = Item(id: UUID(), peca: "CU", descricao: "", preco: 0.0, tamanho: "", medidas: "", avarias: "", hashtags: "")
    
    var body: some View {
        
        HStack {
            Text("**Peça**: \(nomePeca)")
                .frame(width: 238, alignment: .leading)
                .font(.title3)
            
            Spacer()
            
            Button{
                
            } label: {
                
                Image(systemName: "doc.on.doc")
                    .font(.system(size: 14))
                    .foregroundStyle(Color("txtBttnColor"))
                    .padding()
            }
            .background(Color("bttnColor"))
            .cornerRadius(14)
        }
        .padding(.horizontal)
        .onAppear {
            
            itemStruct.peca = nomePeca
            itemStruct.descricao = descricao
            itemStruct.preco = preco
            itemStruct.tamanho = tamanho
            itemStruct.medidas = medidas
            itemStruct.avarias = avarias
            itemStruct.hashtags = hashtag
            
            
            print(itemStruct)
            
            
            viewModel.sendMessage(item: itemStruct)
        }
        
        Divider()
        VStack{
                ScrollView (.horizontal) {
                    HStack {
                        ForEach(viewModel.messages.filter({$0.role == .assistant}), id: \.id) { message in
                            
                                    VStack {
                                        ScrollView{
                                            messageView(message: message)
                                        }
                                    }
                                    .frame(maxWidth: 327, maxHeight: 438)
                                    .font(.callout)
                                    .padding()
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(.bttn, lineWidth: 1)
                                    ).padding()
                                    
                                }
                        
//                                            VStack {
//                                                ScrollView{
//                                                    Text("**@brecho** Suéter Coreano estampado cinza claro com detalhes em bordô Peça em acrílico, macio ao toque e em perfeito estado! Tamanho M por R$65,00 \n\nMedidas: busto: 120-140 cm \ncomprimento: 65 cm \nombro: 52 cm \nmanga: 64 cm \n\n✰Primeira pessoa a comentar quero ou mandar mensagem leva a peça.  \n\n✰Pagamentos via pix, crédito ou débito (acréscimo de taxa da maquininha para as opções no cartão) \n\n✰Envios para todo o Brasil. \n\nChama no inbox para mais informações!#brecho #brechoonline #brechovirtual #brechopr #brechocuritiba")
//                                                }
//                                            }
//                                            .frame(maxWidth: 327, maxHeight: 438)
//                                            .font(.callout)
//                                            .padding()
//                                            .overlay(
//                                                RoundedRectangle(cornerRadius: 16)
//                                                    .stroke(.bttn, lineWidth: 1)
//                                            ).padding()
                        
                    }
                }
            
            
            
            Button {
                
                print(itemStruct)
                
                viewModel.sendMessage(item: itemStruct)
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
            
            
            NavigationLink {
                IntroView()
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
    
    
    func messageView(message: Message) -> some View {
        HStack {
            Text(message.content)
        }
        
    }
    
    
}

#Preview {
    DescriptionView(nomePeca: .constant("cu"), descricao: .constant(""), preco: .constant(0.0), tamanho: .constant(""), medidas: .constant(""), avarias: .constant(""), hashtag: .constant(""))
}
