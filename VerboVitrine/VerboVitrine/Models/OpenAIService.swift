//
//  OpenAIService.swift
//  VerboVitrine
//
//  Created by Kauane Santana on 08/11/23.
//

import SwiftUI
import Alamofire

class OpenAIService {
    private let endpointUrl = "https://api.openai.com/v1/chat/completions"
    
    func sendMessage(messages: [Message]) async -> OpenAIChatResponse? {
        let openAIMessages = messages.map({OpenAIChatMessage(role: $0.role, content: $0.content)})
        let body = OpenAIChatBody(model: "gpt-3.5-turbo", messages: openAIMessages)
        let header: HTTPHeaders = [
            "Authorization" : "Bearer \(Constants.openAIApiKey)"
        ]
        return try? await AF.request(endpointUrl, method: .post, parameters:  body, encoder: .json, headers:   header).serializingDecodable(OpenAIChatResponse.self).value
    }
}


struct OpenAIChatBody: Encodable {
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
