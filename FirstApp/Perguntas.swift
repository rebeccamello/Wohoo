//
//  Perguntas.swift
//  FirstApp
//
//  Created by Gabriele Namie on 03/06/21.
//

import Foundation
struct Pergunta: Codable{
    let nomePergunta: String
    let resposta: String
    var isFavorito: Bool
    
    
    static var logos: [Pergunta]{
        let rc = ReadContent()
        return rc.load(filename: "data")
        
    }
    
    static var marcas: [Pergunta]{
        let rcm = ReadContent()
        return rcm.load(filename: "marca")
    }
    
    static var servicos: [Pergunta]{
        let rcs = ReadContent()
        return rcs.load(filename: "servico")
    }
    static var logosFavoritos: [Pergunta]{
        let rclf = ReadContent()
        return rclf.filtrarFavoritos(filename: "data")
    }
    static var marcasFavoritos: [Pergunta]{
        let rcmf = ReadContent()
        return rcmf.filtrarFavoritos(filename: "marca")
    }
    static var servicosFavoritos: [Pergunta]{
        let rcsf = ReadContent()
        return rcsf.filtrarFavoritos(filename: "servico")
    }
    static var populares: [Pergunta]{
        let rcp = ReadContent()
        return rcp.filtrarFavoritos(filename: "populares")
    }
}


