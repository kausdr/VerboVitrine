//
//  OpenAIService.swift
//  VerboVitrine
//
//  Created by Isabela Bastos Jastrombek on 09/11/23.
//

import Foundation
import Alamofire

class OpenAIService {
    private let endpointURL = "https://api.openai.com/v1/chat/completions"
    
    func sendMessage(messages: [Message]) async -> OpenAIChatResponse? {
        let openAIMessages = messages.map({OpenAIChatMessage(role: $0.role, content: $0.content)})
        
        let body = OpenAiChatBody(model: "gpt-3.5-turbo", messages: openAIMessages)
        let header: HTTPHeaders = [
            "Authorization": "Bearer \(Constants.openAIApiKey)"
        ]
        
        return try? await AF.request(endpointURL, method: .post, parameters: body, encoder: .json, headers: header).serializingDecodable(OpenAIChatResponse.self).value
    }
}

struct OpenAiChatBody: Encodable {
    let model: String
    let messages: [OpenAIChatMessage]
}

struct OpenAIChatMessage: Codable {
    let role: SenderRole
    let content: String
}

enum SenderRole: String, Codable {
    case system
    case user
    case assistant
}

struct OpenAIChatResponse: Decodable {
    let choices: [OpenAIChatChoice]
}

struct OpenAIChatChoice: Decodable {
    let message: OpenAIChatMessage
}
