//
//  MedidasView.swift
//  VerboVitrine
//
//  Created by Isabela Bastos Jastrombek on 13/11/23.
//

import SwiftUI

struct MedidasView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var width: CGFloat = 0
    @State var width1: CGFloat = 10
    
    @State var compr: Int = 0
    @State var ombro: Int = 0
    @State var comprManga: Int = 0
    
    @Binding var medidas: String
    
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        formatter.zeroSymbol  = ""
        return formatter
    }()
    
    @State var naoAlterado: Bool = true
    
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
                
                Text("Medidas")
                    .font(.title)
                    .bold()
                
                Spacer()
                
                Button {
                    let b = getValue(val: width) != "0" ? "Busto: \(getValue(val: width)) até \(getValue(val: width1))cm," : ""
                    let c = compr != 0 ? "Comprimento: \(compr)cm," : ""
                    let o = ombro != 0 ? "Ombro: \(ombro)cm," : ""
                    let m = comprManga != 0 ? "Comprimento da Manga: \(comprManga)cm" : ""
                    
                    medidas = "Medidas: \(b) \(c) \(o) \(m)"
                    print(medidas)
                    
                    dismiss()
                } label: {
                    Label("Done", systemImage: "checkmark")
                        .labelStyle(.iconOnly)
                        .foregroundStyle(naoAlterado ? Color("bttnColor").opacity(0.3) : Color("bttnColor"))
                        .font(.headline)
                }
                .disabled(naoAlterado)
                //                .disabled(newtitle.isEmpty)
            }
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Busto")
                        .font(.body)
                        .bold()
                    
                    
                    
                    HStack {
                        Text("\(getValue(val: width))")
                            .foregroundStyle(Color("bttnColor").opacity(0.5))
                            .frame(width: 34)
                        
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(.gray.opacity(0.3))
                                .frame(width: 260 ,height: 4)
                            
                            RoundedRectangle(cornerRadius: 4)
                                .fill(.blue)
                                .frame(width: self.width1 - self.width ,height: 4)
                                .offset(x: self.width + 28)
                            
                            HStack(spacing: 0) {
                                Circle()
                                    .fill(.white)
                                    .frame(width: 28, height: 28)
                                    .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 0.5)
                                    .offset(x: self.width)
                                    .gesture(
                                        DragGesture()
                                            .onChanged({ (value) in
                                                if value.location.x >= 0 && value.location.x <= self.width1 {
                                                    self.width = value.location.x
                                                }
                                            })
                                    )
                                
                                Circle()
                                    .fill(.white)
                                    .frame(width: 28, height: 28)
                                    .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 0.5)
                                    .offset(x: self.width1)
                                    .gesture(
                                        DragGesture()
                                            .onChanged({ (value) in
                                                if value.location.x >= self.width && value.location.x <= 210 {
                                                    self.width1 = value.location.x
                                                }
                                                
                                            })
                                    )
                            }
                            
                        }
                        
                        Text("\(getValue(val: width1))")
                            .foregroundStyle(Color("bttnColor").opacity(0.5))
                            .frame(width: 34)
                    }
                    
                    ///
                    
                    VStack(alignment: .leading) {
                        Text("Comprimento")
                            .font(.body)
                            .bold()
                        
                        TextField("Insira", value: $compr, formatter: numberFormatter)
                            .keyboardType(.numbersAndPunctuation)
                            .padding(.horizontal, 16)
                        
                        Rectangle()
                            .fill(Color(.systemGray))
                            .frame(height: 0.5)
                            .padding(.horizontal, 16)
                    }
                    
                    ///
                    
                    VStack(alignment: .leading) {
                        Text("Ombro")
                            .font(.body)
                            .bold()
                        
                        TextField("Insira", value: $ombro, formatter: numberFormatter)
                            .keyboardType(.numbersAndPunctuation)
                            .padding(.horizontal, 16)
                        
                        Rectangle()
                            .fill(Color(.systemGray))
                            .frame(height: 0.5)
                            .padding(.horizontal, 16)
                        
                    }
                    
                    ///
                    
                    VStack(alignment: .leading) {
                        Text("Comprimento da Manga")
                            .font(.body)
                            .bold()
                        
                        TextField("Insira", value: $comprManga, formatter: numberFormatter)
                            .keyboardType(.numbersAndPunctuation)
                            .padding(.horizontal, 16)
                        
                        Rectangle()
                            .fill(Color(.systemGray))
                            .frame(height: 0.5)
                            .padding(.horizontal, 16)
                        
                    }
                }
                
                ///
                
            }
        }
        .onTapGesture {
            naoAlterado = false
        }
        .padding(32)
    }
    
    func getValue(val: CGFloat) -> String {
        return String(format: "%.0f", val)
    }
    
}

#Preview {
    MedidasView(medidas: .constant(""))
}
