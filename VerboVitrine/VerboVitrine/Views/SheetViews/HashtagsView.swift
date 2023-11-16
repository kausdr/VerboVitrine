//
//  HashtagsView.swift
//  VerboVitrine
//
//  Created by Isabela Bastos Jastrombek on 13/11/23.
//

import SwiftUI

struct HashtagsView: View {
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
                        .font(.headline)
                }
                
                Spacer()
                
                Text("Hashtags")
                    .font(.title)
                    .bold()
                
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    Label("Done", systemImage: "checkmark")
                        .labelStyle(.iconOnly)
                        .foregroundStyle(Color("bttnColor"))
                        .font(.headline)
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
    HashtagsView()
}
