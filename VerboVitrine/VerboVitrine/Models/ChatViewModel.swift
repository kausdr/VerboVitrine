//
//  ChatViewModel.swift
//  VerboVitrine
//
//  Created by Isabela Bastos Jastrombek on 08/11/23.
//

import Foundation

extension ChatView {
    class ViewModel: ObservableObject {
        @Published var messages: [Message] = []
        @Published var currentInput: String = ""
        private let openAIService = OpenAIService()
        
        func sendMessage() {
            let newMessage = Message(id: UUID(), role: .user, content: currentInput, createdAt: Date())
            messages.append(newMessage)
            currentInput = ""
            
            Task {
                let respose = await openAIService.sendMessage(messages: messages)
                guard let receivedOpenAIMessage = respose?.choices.first?.message else {
                    print("Nenhuma mensagem recebida")
                    return
                }
                let receivedMessage = Message(id: UUID(), role: receivedOpenAIMessage.role, content: receivedOpenAIMessage.content, createdAt: Date())
                await MainActor.run {
                    messages.append(receivedMessage)
                }
            }
        }
    }
}

struct Message: Decodable {
    let id: UUID
    let role: SenderRole
    let content: String
    let createdAt: Date
}
