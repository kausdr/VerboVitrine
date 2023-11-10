//
//  ContentView.swift
//  VerboVitrine
//
//  Created by Kauane Santana on 07/11/23.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(viewModel.messages.filter({$0.role != .system}), id: \.id) { message in
                    messageView(message: message)
                }
            }
            HStack {
                TextField("Escreva uma mensagem...", text: $viewModel.currentInput)
                
                Button {
                    viewModel.sendMessage()
                } label: {
                    Text("Enviar")
                }
            }
        }
        .padding()
    }
    
    func messageView(message: Message) -> some View {
        HStack {
            if message.role == .user { Spacer()}
            Text(message.content)
            if message.role == .assistant { Spacer()}
        }
    }
}

#Preview {
    ChatView()
}
