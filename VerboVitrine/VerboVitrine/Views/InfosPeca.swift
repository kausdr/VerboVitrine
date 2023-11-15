//
//  InfosPeca.swift
//  VerboVitrine
//
//  Created by Kauane Santana on 10/11/23.
//

import SwiftUI

struct InfosPeca: View {
    @ObservedObject var viewModel = ViewModel()
    
    
    @State var nomePeca: String = ""
    @State var descricao: String = ""
    @State var preco: Double = 0.0
    @State var tamanho: String = ""
    @State var medidas: String = ""
    @State var avarias: String = ""
    @State var hashtag: String = ""
    
    @State var showSheetMedidas: Bool = false
    @State var showSheetHashtag: Bool = false
    @State var showSheetDescBase: Bool = false 
    
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        formatter.zeroSymbol  = ""
        return formatter
    }()
    
    var body: some View {
        NavigationView{
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
                
                Button {
                    showSheetMedidas.toggle()
                } label: {
                    HStack(spacing: 4) {
                        Image(systemName: "ruler")
                            .font(.system(size: 14))
                        
                        Text("Medidas")
                            .font(.body)
                            .bold()
                    }
                    .foregroundStyle(.black)
                }
                
                Text(medidas != "" ? medidas : "Nenhuma medida")
                    .foregroundStyle(.gray)
                    .onChange(of: medidas) { oldValue, newValue in
                        print("medida - old: \(oldValue) - new: \(newValue)")
                    }
                //                .padding(.horizontal, 16)
                
                Spacer()
                
                ///
                
                Button {
                    showSheetHashtag.toggle()
                } label: {
                    HStack(spacing: 4) {
                        Image(systemName: "number.circle")
                            .font(.system(size: 20))
                        
                        Text("Hashtags")
                            .font(.body)
                            .bold()
                    }
                    .foregroundStyle(.black)
                }
                
                Rectangle()
                    .fill(Color(.systemGray))
                    .frame(height: 0.5)
                
                ///
                
                
                Button {
                    showSheetDescBase.toggle()
                } label: {
                    HStack(spacing: 4) {
                        Image(systemName: "pencil.circle")
                            .font(.system(size: 20))
                        
                        Text("Descrição base")
                            .font(.body)
                            .bold()
                    }
                    .foregroundStyle(.black)
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
                    
                    NavigationLink {
                        DescriptionView()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 14)
                                .fill(nomePeca == "" ? Color(uiColor: .clear) : Color("bttnColor"))
                                .strokeBorder(nomePeca == "" ? Color(uiColor: .systemGray) : Color(uiColor: .clear))
                            
                            Text("Gerar")
                                .foregroundStyle(nomePeca == "" ? Color(uiColor: .systemGray) : Color("txtBttnColor"))
                            
                            
                        }
                        .frame(width: 86 ,height: 48)
                    }
                    .onTapGesture {
                                            var itemStruct = Item(id: UUID(), peca: "", descricao: "", preco: 0.0, tamanho: "", medidas: "", avarias: "", hashtags: "")
                        
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
                    .disabled(nomePeca == "")
                    
                }
            }
            .padding(24)
            .sheet(isPresented: $showSheetMedidas) {
                MedidasView(medidas: $medidas)
                    .presentationDetents([.medium])
                    .presentationCornerRadius(40)
            }
            .sheet(isPresented: $showSheetHashtag) {
                HashtagsView()
                    .presentationDetents([.medium])
                    .presentationCornerRadius(40)
            }
            .sheet(isPresented: $showSheetDescBase) {
                DescBaseView()
                    .presentationDetents([.medium])
                    .presentationCornerRadius(40)
            }
        }
    }
}

#Preview {
    InfosPeca()
}
