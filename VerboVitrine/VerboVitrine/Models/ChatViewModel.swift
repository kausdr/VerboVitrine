//
//  ChatGPTModel.swift
//  VerboVitrine
//
//  Created by Kauane Santana on 08/11/23.
//

import SwiftUI
import Foundation

extension ChatView {
    class ViewModel: ObservableObject {
        @Published var messages: [Message] = []
        
        @Published var currentInput: String = ""
        
        private let openAIService = OpenAIService()
        
        func sendMessage() {
            let newMessage = Message(id: UUID(), role: .user, content: currentInput, createAt: Date())
            messages.append(newMessage)
            currentInput = ""
            
            Task {
                let response = await openAIService.sendMessage(messages: messages)
                print(response ?? "Response Nil")
                guard let receivedOpenAIMessage = response?.choices.first?.message else {
                    print("deu ruim, pai")
                    return
                }
                
                let receivedMessage = Message(id: UUID(), role: receivedOpenAIMessage  .role, content: receivedOpenAIMessage.content, createAt: Date())
                await MainActor.run{
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
    let createAt: Date
}
