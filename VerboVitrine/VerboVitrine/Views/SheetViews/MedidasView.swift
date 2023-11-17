//
//  MedidasView.swift
//  VerboVitrine
//
//  Created by Isabela Bastos Jastrombek on 13/11/23.
//

import SwiftUI

struct MedidasView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var bustoMin: CGFloat = 20
    @State var bustoMax: CGFloat = 100
    
    @State var ganchoMin: CGFloat = 20
    @State var ganchoMax: CGFloat = 100
    
    @State var quadrilMin: CGFloat = 20
    @State var quadrilMax: CGFloat = 100
    
    @State var cinturaMin: CGFloat = 20
    @State var cinturaMax: CGFloat = 100
    
    @State var compr: Int = 0
    @State var ombro: Int = 0
    @State var comprManga: Int = 0
    @State var corte: String = ""
    
    
    @Binding var medidas: String
    @Binding var medidaType: String
    
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
                    let r = corte != "" ? "Comprimento: \(corte)," : ""
                    let b = getValue(val: bustoMin) != "0" ? "Busto: \(getValue(val: bustoMin)) até \(getValue(val: bustoMax))cm," : ""
                    let c = compr != 0 ? "Comprimento: \(compr)cm," : ""
                    let o = ombro != 0 ? "Ombro: \(ombro)cm," : ""
                    let m = comprManga != 0 ? "Comprimento da Manga: \(comprManga)cm" : ""
                    let g = getValue(val: ganchoMin) != "0" ? "Gancho: \(getValue(val: ganchoMin)) até \(getValue(val: bustoMax))cm," : ""
                    let q = getValue(val: quadrilMin) != "0" ? "Quadril: \(getValue(val: quadrilMin)) até \(getValue(val: quadrilMax))cm," : ""
                    let t = getValue(val: cinturaMin) != "0" ? "Cintura: \(getValue(val: cinturaMin)) até \(getValue(val: cinturaMax))cm," : ""
                    
                    medidas = "Medidas: \(r)\(b)\(c)\(o)\(m)\(g)\(q)\(t)"
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
                    
                    ///
                    if medidaType == "todos" || medidaType == "baixo" {
                        VStack(alignment: .leading) {
                            Text("Corte")
                                .font(.body)
                                .bold()
                            
                            TextField("Insira", text: $corte)
                                .keyboardType(.numbersAndPunctuation)
                                .padding(.horizontal, 16)
                            
                            Rectangle()
                                .fill(Color(.systemGray))
                                .frame(height: 0.5)
                                .padding(.horizontal, 16)
                        }
                    }
                    
                    ///
                    
                    if medidaType == "todos" || medidaType == "cima" {
                        
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
                                    .frame(width: 260 ,height: 5)
                                
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(.blue)
                                    .frame(width: self.bustoMax - self.bustoMin ,height: 5)
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
                    
                    if medidaType == "todos" || medidaType == "cima" {
                        
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
                    }
                    
                    ///
                    
                    if medidaType == "todos" || medidaType == "cima" {
                        
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
                    
                    if medidaType == "todos" || medidaType == "baixo" {
                        
                        Text("Gancho")
                            .font(.body)
                            .bold()
                        
                        
                        
                        HStack {
                            Text("\(getValue(val: ganchoMin))")
                                .foregroundStyle(Color("bttnColor").opacity(0.5))
                                .frame(width: 34)
                            
                            ZStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(.gray.opacity(0.3))
                                    .frame(width: 260 ,height: 5)
                                
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(.blue)
                                    .frame(width: self.ganchoMax - self.ganchoMin ,height: 5)
                                    .offset(x: self.ganchoMin + 28)
                                
                                HStack(spacing: 0) {
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 28, height: 28)
                                        .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 0.5)
                                        .offset(x: self.ganchoMin)
                                        .gesture(
                                            DragGesture()
                                                .onChanged({ (value) in
                                                    if value.location.x >= 0 && value.location.x <= self.ganchoMax {
                                                        self.ganchoMin = value.location.x
                                                    }
                                                })
                                        )
                                    
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 28, height: 28)
                                        .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 0.5)
                                        .offset(x: self.ganchoMax)
                                        .gesture(
                                            DragGesture()
                                                .onChanged({ (value) in
                                                    if value.location.x >= self.ganchoMin && value.location.x <= 210 {
                                                        self.ganchoMax = value.location.x
                                                    }
                                                    
                                                })
                                        )
                                }
                                
                            }
                            
                            Text("\(getValue(val: ganchoMax))")
                                .foregroundStyle(Color("bttnColor").opacity(0.5))
                                .frame(width: 34)
                        }
                        
                        ///
                        
                        Text("Quadril")
                            .font(.body)
                            .bold()
                        
                        
                        
                        HStack {
                            Text("\(getValue(val: quadrilMin))")
                                .foregroundStyle(Color("bttnColor").opacity(0.5))
                                .frame(width: 34)
                            
                            ZStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(.gray.opacity(0.3))
                                    .frame(width: 260 ,height: 5)
                                
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(.blue)
                                    .frame(width: self.quadrilMax - self.quadrilMin ,height: 5)
                                    .offset(x: self.quadrilMin + 28)
                                
                                HStack(spacing: 0) {
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 28, height: 28)
                                        .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 0.5)
                                        .offset(x: self.quadrilMin)
                                        .gesture(
                                            DragGesture()
                                                .onChanged({ (value) in
                                                    if value.location.x >= 0 && value.location.x <= self.quadrilMax {
                                                        self.quadrilMin = value.location.x
                                                    }
                                                })
                                        )
                                    
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 28, height: 28)
                                        .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 0.5)
                                        .offset(x: self.quadrilMax)
                                        .gesture(
                                            DragGesture()
                                                .onChanged({ (value) in
                                                    if value.location.x >= self.quadrilMin && value.location.x <= 210 {
                                                        self.quadrilMax = value.location.x
                                                    }
                                                    
                                                })
                                        )
                                }
                                
                            }
                            
                            Text("\(getValue(val: quadrilMax))")
                                .foregroundStyle(Color("bttnColor").opacity(0.5))
                                .frame(width: 34)
                        }
                        
                        ///
                        
                        Text("Cintura")
                            .font(.body)
                            .bold()
                        
                        
                        
                        HStack {
                            Text("\(getValue(val: cinturaMin))")
                                .foregroundStyle(Color("bttnColor").opacity(0.5))
                                .frame(width: 34)
                            
                            ZStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(.gray.opacity(0.3))
                                    .frame(width: 260 ,height: 5)
                                
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(.blue)
                                    .frame(width: self.cinturaMax - self.cinturaMin ,height: 5)
                                    .offset(x: self.cinturaMin + 28)
                                
                                HStack(spacing: 0) {
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 28, height: 28)
                                        .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 0.5)
                                        .offset(x: self.cinturaMin)
                                        .gesture(
                                            DragGesture()
                                                .onChanged({ (value) in
                                                    if value.location.x >= 0 && value.location.x <= self.cinturaMax {
                                                        self.cinturaMin = value.location.x
                                                    }
                                                })
                                        )
                                    
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 28, height: 28)
                                        .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 0.5)
                                        .offset(x: self.cinturaMax)
                                        .gesture(
                                            DragGesture()
                                                .onChanged({ (value) in
                                                    if value.location.x >= self.cinturaMin && value.location.x <= 210 {
                                                        self.cinturaMax = value.location.x
                                                    }
                                                    
                                                })
                                        )
                                }
                                
                            }
                            
                            Text("\(getValue(val: cinturaMax))")
                                .foregroundStyle(Color("bttnColor").opacity(0.5))
                                .frame(width: 34)
                        }
                    }
                }
                
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
    MedidasView(medidas: .constant(""), medidaType: .constant("todos"))
}
