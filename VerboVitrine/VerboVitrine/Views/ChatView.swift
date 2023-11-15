////
////  ChatView.swift
////  VerboVitrine
////
////  Created by Kauane Santana on 08/11/23.
////
//
//import SwiftUI
//
//struct ChatView: View {
//    @ObservedObject var viewModel = ViewModel()
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                ScrollView{
//                    ForEach(viewModel.messages.filter({$0.role != .system}), id: \.id) { message in
//                        messageView(message: message)
//                    }
//                }
//                
//                HStack{
//                        NavigationLink {
//                            DescriptionView()
//                        } label: {
//                            Text("Gerar")
//                                .frame(maxWidth: .infinity)
//                        }
//                    
//                    
//                    //                Button {
//                    //                    var itemStruct = Item(id: UUID(), peca: "pega aqui", descricao: "no meu", preco: 0.0, tamanho: "oi", medidas: "tchau", avarias: "blabla", hashtags: "")
//                    //                    viewModel.sendMessage(item: itemStruct)
//                    //                } label: {
//                    //                    Text("Gerar")
//                    //                }
//                }
//            }
//        }
//        
//    }
//    
//    func messageView(message: Message) -> some View {
//        HStack {
//            if message.role == .user {Spacer()}
//            Text(message.content)
//            if message.role == .assistant {Spacer()}
//        }
//        
//    }
//}
//
//#Preview {
//    ChatView()
//}
