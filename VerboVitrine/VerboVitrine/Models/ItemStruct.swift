//
//  ParametersStruct.swift
//  VerboVitrine
//
//  Created by Isabela Bastos Jastrombek on 10/11/23.
//

import Foundation

struct Item {
    let id: UUID
    let peca: String
    let preco: Double
    let tamanho: String
    let medidas: String
    let avarias: String
    let hashtags: [String]
    let createAt: Date
}
