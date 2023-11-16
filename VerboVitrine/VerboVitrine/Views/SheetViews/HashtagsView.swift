//
//  HashtagsView.swift
//  VerboVitrine
//
//  Created by Isabela Bastos Jastrombek on 13/11/23.
//

import SwiftUI

struct HashtagsView: View {
    @State var hash: String = ""
    @Binding var hashtag: String
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
                    hashtag = hash
                    dismiss()
                } label: {
                    Label("Done", systemImage: "checkmark")
                        .labelStyle(.iconOnly)
                        .foregroundStyle(hash == "" ? Color("bttnColor").opacity(0.3) : Color("bttnColor"))
                        .font(.headline)
                }
                .disabled(hash == "")
            }
            .padding(32)
            
            ScrollView {
                TextField("Hashtags...", text: $hash, axis: .vertical)
                    .padding(.horizontal, 32)
                
                Rectangle()
                    .fill(Color(.systemGray))
                    .frame(height: 0.5)
                    .padding(.horizontal, 24)
            }
        }
    }
}

#Preview {
    HashtagsView(hashtag: .constant(""))
}
