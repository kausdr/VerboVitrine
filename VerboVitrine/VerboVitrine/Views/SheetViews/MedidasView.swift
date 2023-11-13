//
//  MedidasView.swift
//  VerboVitrine
//
//  Created by Isabela Bastos Jastrombek on 13/11/23.
//

import SwiftUI

struct MedidasView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var minBusto = 0
    @State var maxBusto = 150
    @State var width: CGFloat = 0
    @State var width1: CGFloat = 10
    var totalWidth = UIScreen.main.bounds.width - 10
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Label("cancel", systemImage: "xmark")
                        .labelStyle(.iconOnly)
                        .foregroundStyle(Color("bttnColor"))
                        .font(.title3)
                }
                
                Spacer()
                
                Text("Medidas")
                    .font(.title)
                    .bold()
                
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    Label("Done", systemImage: "checkmark")
                        .labelStyle(.iconOnly)
                        .foregroundStyle(Color("bttnColor"))
                        .font(.title3)
                }
                //                .disabled(newtitle.isEmpty)
            }
            
            ScrollView {
                HStack {
                    Text("\(width)")
                        .foregroundStyle(Color("bttnColor").opacity(0.5))
                    
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
                                .fill(Color("txtBttnColor"))
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
                                .fill(Color("txtBttnColor"))
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
                    
                    Text("\(width1)")
                        .foregroundStyle(Color("bttnColor").opacity(0.5))
                }
            }
        
            
            
        }
        
        .padding(32)
    }
    
}

#Preview {
    MedidasView()
}
