//
//  ChatView.swift
//  VerboVitrine
//
//  Created by Kauane Santana on 08/11/23.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
                ForEach(viewModel.messages.filter({$0.role != .system}), id: \.id) { message in
                    messageView(message: message)
            }
            
            HStack{
                TextField("Escreva aqui", text: $viewModel.currentInput)
                Button {
                    viewModel.sendMessage()
                } label: {
                    Text("Gerar")
                }
            }
        }
    }
    
    func messageView(message: Message) -> some View {
        HStack {
            if message.role == .user {Spacer()}
            Text(message.content)
            if message.role == .assistant {Spacer()}
        }
        
    }
}

#Preview {
    ChatView()
}
