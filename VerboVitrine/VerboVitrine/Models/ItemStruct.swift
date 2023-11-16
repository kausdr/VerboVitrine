//
//  ParametersStruct.swift
//  VerboVitrine
//
//  Created by Isabela Bastos Jastrombek on 10/11/23.
//

import Foundation

struct Item {
    var id: UUID
    var peca: String?
    var descricao: String?
    var preco: Double?
    var tamanho: String?
    var medidas: String?
    var avarias: String?
    var hashtags: String?
    
    func buildRequestText() -> String {
        
//        var requestText: String = """
//    Atuando como um dono de brechó digital, escreva uma legendas para posts.
//
//    Os parâmetros serão os dados sobre duas peças de venda, você irá retornar uma legenda curta com um tom informativo mas informal falando bem da peça.
//    Primeiro inclua qualidades da peça indicando que ela será uma boa peça para o comprador.
//
//    A segunda parte da legenda é opcional, que irá ser inserida após o espaçamento de uma linha e poderá conter alguma informação extra.
//
//    Não adicione nenhuma hashtag.
//
//    Não use flexão de gênero.
//
//    A seguir irão ser fornecidos parâmetros. Responda apenas com a legenda, não adicione comentários além da legenda, nem aspas.
//    Não adicione as palavras entre asteriscos "*”
//    
//    Peça: \(peca ?? "")
//    \(descricao == "" ? "" : "Descrição: \(descricao ?? "")")
//    
//    \(tamanho == "" ? "" : "Tamanho: \(tamanho ?? "")")
//    
//    \(preco == nil ? "" : "Informe o valor ao leitor: \(preco!)")
//
//    Medidas:
//    \(medidas == "" ? "" : "busto: \(medidas ?? "")")
//
//    Chat GPT, peça para o leitor comentar "quero” no fim da legenda
//
//    Diga para o leitor que esses são os métodos de pagamento: pix, crédito, débito (acréscimo de taxa da maquininha para as opções no cartão)
//
//    Diga para o leitor que o envio é para todo o Brasil.
//
//    Baseie-se na estrutura do modelo abaixo:
//    “
//    Bucket 🙂
//
//    na cor cinza, super fofo, peça praticamente nova e bem estruturado
//
//    tam: 53 cm de circunferência
//    valor: 30,00
//
//    🪤 Primeira pessoa a comentar "quero" ou mandar dm leva.
//    🪤 Mais informações/fotos da peça: inbox.
//    #brecho #brechoonline #brechovirtual #brechopr #brechocuritiba”
//    """

        
        var requestText: String =  """
Atuando como um dono de brechó digital, escreva uma legendas para posts.

Os parâmetros serão os dados sobre duas peça de venda, você irá retornar uma legenda curta com um tom informativo mas informal falando bem da peça.
Primeiro inclua qualidades da peça indicando que ela será uma boa peça para o comprador.
 A segunda parte da legenda é opcional, que irá ser inserida após o espaçamento de uma linha e poderá conter alguma informação extra.

Não adicione nenhuma hashtag.

A seguir irão ser fornecidos parâmetros. Responda apenas com a legenda, não adicione comentários além da legenda, nem aspas.
Não adicione as palavras entre asteriscos "*”

Peça:  \(peca ?? "")

    \(descricao == "" ? "" : "Descrição: \(descricao ?? "")")
    \(tamanho == "" ? "" : "Tamanho: \(tamanho ?? "")")
 \(preco == 0.0 ? "" : "Informe o valor ao leitor: \(preco!)")

    \(medidas == "" ? "" : "Medidas: \(medidas ?? "")")
 Chat GPT, peça para o leitor comentar "quero” no fim da legenda

Diga para o leitor que esses são os métodos de pagamento: pix, crédito, débito (acréscimo de taxa da maquininha para as opções no cartão)

Envio: para todo o Brasil.
 
"""
        
        
//    var requestText: String = """
//Atuando como um dono de brechó digital, escreva uma legendas para posts.
//
//    Os parâmetros serão os dados sobre duas peças de venda, você irá retornar uma legenda curta com um tom informativo mas informal falando bem da peça.
//    Primeiro inclua qualidades da peça indicando que ela será uma boa peça para o comprador.
//     A segunda parte da legenda é opcional, que irá ser inserida após o espaçamento de uma linha e poderá conter alguma informação extra.
//
//    Não adicione nenhuma hashtag.
//
//    A seguir irão ser fornecidos parâmetros. Responda apenas com a legenda, não adicione comentários além da legenda, nem aspas.
//    Não adicione as palavras entre asteriscos "*”  Peça:  \(peca ?? "")
//        \(descricao == "" ? "" : "Descrição: \(descricao ?? "")")  \(tamanho == "" ? "" : "Tamanho: \(tamanho ?? "")")  \(preco == 0.0 ? "" : "Informe o valor ao leitor: \(preco!)")
//
//    \(medidas == "" ? "" : "Medidas: \(medidas ?? "")")
//     Chat GPT, peça para o leitor comentar "quero” no fim da legenda
//
//    Diga para o leitor que esses são os métodos de pagamento: pix, crédito, débito (acréscimo de taxa da maquininha para as opções no cartão)
//
//    Baseie-se na estrutura do modelo abaixo:
//    [vendido] Bucket 🙂
//
//    na cor cinza, super fofo, peça praticamente nova e bem estruturado
//
//    tam: 53 cm de circunferência
//    valor: 30,00
//
//    🪤 Primeira pessoa a comentar "quero" ou mandar dm leva.
//    🪤 Mais informações/fotos da peça: inbox.
//    #brecho #brechoonline #brechovirtual #brechopr #brechocuritiba ”
//
//    *Envio:* para todo o Brasil.
//
//    Não adicione nenhuma hashtag.
//"""
        
    return requestText
    }
}


