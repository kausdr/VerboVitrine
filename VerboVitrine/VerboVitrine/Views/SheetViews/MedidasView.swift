//
//  MedidasView.swift
//  VerboVitrine
//
//  Created by Isabela Bastos Jastrombek on 13/11/23.
//

import SwiftUI

struct MedidasView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var bustoMin: CGFloat = 0
    @State var bustoMax: CGFloat = 10
    
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
                    let b = getValue(val: bustoMin) != "0" ? "Busto: \(getValue(val: bustoMin)) até \(getValue(val: bustoMax))cm," : ""
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
                        Text("\(getValue(val: bustoMin))")
                            .foregroundStyle(Color("bttnColor").opacity(0.5))
                            .frame(width: 34)
                        
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(.gray.opacity(0.3))
                                .frame(width: 260 ,height: 4)
                            
                            RoundedRectangle(cornerRadius: 4)
                                .fill(.blue)
                                .frame(width: self.bustoMax - self.bustoMin ,height: 4)
                                .offset(x: self.bustoMin + 28)
                            
                            HStack(spacing: 0) {
                                Circle()
                                    .fill(.white)
                                    .frame(width: 28, height: 28)
                                    .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 0.5)
                                    .offset(x: self.bustoMin)
                                    .gesture(
                                        DragGesture()
                                            .onChanged({ (value) in
                                                if value.location.x >= 0 && value.location.x <= self.bustoMax {
                                                    self.bustoMin = value.location.x
                                                }
                                            })
                                    )
                                
                                Circle()
                                    .fill(.white)
                                    .frame(width: 28, height: 28)
                                    .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 0.5)
                                    .offset(x: self.bustoMax)
                                    .gesture(
                                        DragGesture()
                                            .onChanged({ (value) in
                                                if value.location.x >= self.bustoMin && value.location.x <= 210 {
                                                    self.bustoMax = value.location.x
                                                }
                                                
                                            })
                                    )
                            }
                            
                        }
                        
                        Text("\(getValue(val: bustoMax))")
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
