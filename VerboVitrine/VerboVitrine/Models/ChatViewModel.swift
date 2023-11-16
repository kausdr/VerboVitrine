//
//  ChatGPTModel.swift
//  VerboVitrine
//
//  Created by Kauane Santana on 08/11/23.
//

import SwiftUI
import Foundation

class ViewModel: ObservableObject {
    @Published var messages: [Message] = []
    
    private let openAIService = OpenAIService()
    
    func sendMessage(item: Item) {
        let newMessage = Message(id: UUID(), role: .user, content: item.buildRequestText(), createAt: Date())
        messages.append(newMessage)
        
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


 struct Message: Decodable, Equatable {
    let id: UUID
    let role: SenderRole 
    let content: String
    let createAt: Date
}
