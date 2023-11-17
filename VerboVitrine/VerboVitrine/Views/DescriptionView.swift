//
//  DescriptionView.swift
//  VerboVitrine
//
//  Created by Laura Machado Isolani on 13/11/23.
//

import SwiftUI
import UIKit

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
    
    @State var listaVazia: Bool = true
    
    
    var body: some View {
        
        HStack {
            Text("**Peça**: \(nomePeca)")
                .frame(width: 238, alignment: .leading)
                .font(.title3)
            
            Spacer()
            
            Button{
                UIPasteboard.general.string = viewModel.messages.filter({$0.role == .assistant}).suffix(1).last?.content; 
                
                if let pastedText = UIPasteboard.general.string {
                   print("Pasted text: deu certo")
                }
                

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
                        if listaVazia {
                            VStack {
                                HStack {
                                    Text("Sua legenda está sendo gerada...")
                                        .frame(maxWidth: 700, maxHeight: 438)
                                        .padding(.horizontal, 40)
                                }
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .font(.callout)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(.bttn, lineWidth: 1)
                            ).padding()
                            
                            
                        }
                        else {
                            ForEach(viewModel.messages.filter({$0.role == .assistant}).suffix(1), id: \.id) { message in
                                    
                                            VStack {
                                                ScrollView{
                                                    messageView(message: message)
                                                }
                                            }
                                            .frame(maxWidth: 327, maxHeight: .infinity)
                                            .font(.callout)
                                            .padding()
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 16)
                                                    .stroke(.bttn, lineWidth: 1)
                                            ).padding()
                                            
                            }
                            
                            
                        }
                        
                        
                        
                    }
                }
            
            
            
//            Button {
//                
//                print(itemStruct)
//                listaVazia = true
//                
//                viewModel.sendMessage(item: itemStruct)
//            } label: {
//                
//                Text("Refazer legenda")
//                    .foregroundStyle(.bttn)
//                    .bold()
//                    .padding()
//                    .frame(maxWidth: .infinity)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 16)
//                            .stroke(.bttn, lineWidth: 1)
//                    ).padding()
//            }
            
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
        .onChange(of: viewModel.messages) {
            if viewModel.messages.last?.role == .assistant {
                print("a lista mudou")
                listaVazia = false
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
