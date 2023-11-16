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
    
    @State var clearFields: Bool = false
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
                    .foregroundStyle(Color("bttnColor"))
                }
                
                Text(medidas != "" ? medidas : "Nenhuma medida")
                    .foregroundStyle(.gray)
                
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
                    .foregroundStyle(Color("bttnColor"))
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
                    .foregroundStyle(Color("bttnColor"))
                }
                
                Rectangle()
                    .fill(Color(.systemGray))
                    .frame(height: 0.5)
                
                ///
                
                HStack {
                    Button {
                        nomePeca = ""
                        descricao = ""
                        preco = 0.0
                        tamanho = ""
                        medidas = ""
                        avarias = ""
                        hashtag = ""
                    } label: {
                        Image(systemName: "trash")
                            .bold()
                            .foregroundStyle(Color(uiColor: .systemGray))
                    }
                    
                    Spacer()
                    
                    NavigationLink {
                        DescriptionView(nomePeca: $nomePeca, descricao: $descricao, preco: $preco, tamanho: $tamanho, medidas: $medidas, avarias: $avarias, hashtag: $hashtag)
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
                DescBaseView(descricao: $descricao)
                    .presentationDetents([.medium])
                    .presentationCornerRadius(40)
            }
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    InfosPeca()
}
