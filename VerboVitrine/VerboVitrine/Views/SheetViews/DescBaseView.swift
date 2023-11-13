//
//  DescBaseView.swift
//  VerboVitrine
//
//  Created by Isabela Bastos Jastrombek on 13/11/23.
//

import SwiftUI

struct DescBaseView: View {
    @Environment(\.dismiss) var dismiss
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
                
                Text("Descrição base")
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
            .padding(32)
            
            ScrollView {
                Spacer()
            }
            
            
            
        }
    }
}

#Preview {
    DescBaseView()
}
