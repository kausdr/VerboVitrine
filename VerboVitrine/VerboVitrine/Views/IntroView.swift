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
    @State var medidaType: String = "todos"
    
    var body: some View {
        VStack {
            
            Image("LogoDark")
                .resizable()
                .frame(width: 55, height: 25)
                .padding(.top, 88)
            
            Spacer()
            
            VStack {
                
                NavigationLink() {
                    InfosPeca(medidaType: $medidaType)
                } label: {
                    HStack(spacing: 14) {
                        Rectangle()
                            .fill(Color(uiColor: .clear))
                            .frame(width: 20, height: 20)
                            .overlay {
                                Image("sunglasses")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                            }
                        
                        VStack {
                            VStack(alignment: .leading) {
                                Text("Gerar descrição para acessórios")
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.leading)
                                    .font(.footnote)
                                
                                Text("com infos sobre o formato, cor, material e dimensões")
                                    .multilineTextAlignment(.leading)
                                    .font(.caption)
                                Text("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(Color(uiColor: .clear))
                                    .font(.caption)
                                    .frame(height: 0)
                                
                            }
                            .frame(minWidth: 290)
                            
                        }
                    }
                    .padding(20)
                    
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color("bttnColor"), lineWidth: 1)
                    )
                }
                .onAppear() {
                    medidaType = "acessorios"
                }
                
                ///
                
                NavigationLink {
                    InfosPeca(medidaType: $medidaType)
                } label: {
                    HStack(spacing: 14) {
                        Rectangle()
                            .fill(Color(uiColor: .clear))
                            .frame(width: 20, height: 20)
                            .overlay {
                                Image("shirt")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                            }
                        
                        VStack {
                            VStack(alignment: .leading) {
                                Text("Descrever peças de cima")
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.leading)
                                    .font(.footnote)
                                
                                Text("descrevendo botões ou tecidos diferenciados")
                                    .multilineTextAlignment(.leading)
                                    .font(.caption)
                                Text("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(Color(uiColor: .clear))
                                    .font(.caption)
                                    .frame(height: 0)
                                
                            }
                            .frame(minWidth: 290)
                            
                        }
                    }
                    .padding(20)
                    
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color("bttnColor"), lineWidth: 1)
                    )
                }
                .onAppear() {
                    medidaType = "cima"
                }
                ///
                
                Button {
                    medidaType = "baixo"
                } label: {
                    NavigationLink {
                        InfosPeca(medidaType: $medidaType)
                    } label: {
                        HStack(spacing: 14) {
                            Rectangle()
                                .fill(Color(uiColor: .clear))
                                .frame(width: 20, height: 20)
                                .overlay {
                                    Image("pants")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                }
                            
                            VStack {
                                VStack(alignment: .leading) {
                                    Text("Descrever peças de baixo")
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.leading)
                                        .font(.footnote)
                                    
                                    Text("incluindo cintura, comprimento e dimensões")
                                        .multilineTextAlignment(.leading)
                                        .font(.caption)
                                    Text("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(Color(uiColor: .clear))
                                        .font(.caption)
                                        .frame(height: 0)
                                    
                                }
                                .frame(minWidth: 290)
                                
                            }
                        }
                        .padding(20)
                        
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color("bttnColor"), lineWidth: 1)
                        )
                    }
                }
                
                ///
                
                Button {
                    medidaType = "calçado"
                } label: {
                    NavigationLink {
                        InfosPeca(medidaType: $medidaType)
                    } label: {
                        HStack(spacing: 14) {
                            Rectangle()
                                .fill(Color(uiColor: .clear))
                                .frame(width: 20, height: 20)
                                .overlay {
                                    Image("shoes")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                }
                            
                            VStack {
                                VStack(alignment: .leading) {
                                    Text("Descrever calçados")
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.leading)
                                        .font(.footnote)
                                    
                                    Text("com busto, manga, tamanho e dimensões")
                                        .multilineTextAlignment(.leading)
                                        .font(.caption)
                                    Text("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(Color(uiColor: .clear))
                                        .font(.caption)
                                        .frame(height: 0)
                                    
                                }
                                .frame(minWidth: 290)
                                
                            }
                        }
                        .padding(20)
                        
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color("bttnColor"), lineWidth: 1)
                        )
                    }
                }
            }
            .foregroundStyle(Color("bttnColor"))
            .padding(.horizontal, 18)
            
            
            Rectangle()
                .fill(Color(.systemGray))
                .frame(height: 0.5)
                .padding(.vertical)
            
            Button {
                medidaType = "todos"
            } label: {
                NavigationLink {
                    InfosPeca(medidaType: $medidaType)
                } label: {
                    HStack {
                        Image(systemName: "plus")
                            .foregroundStyle(Color(.systemGray))
                            .bold()
                        
                        Text("Descrever do meu jeito")
                            .foregroundStyle(Color(.systemGray))
                            .bold()
                    }
                    .padding(.bottom)
                }
                .frame(maxWidth: .infinity)
            }
            
        }
        .padding(.horizontal, 20)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    IntroView()
}
