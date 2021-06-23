//
//  ReadContent.swift
//  FirstApp
//
//  Created by Gabriele Namie on 03/06/21.
//

import Foundation

class ReadContent {
    
    func load(filename: String) -> [Pergunta] {
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: "json")
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([Pergunta].self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \([Pergunta].self):\n\(error)")
        }
    }
    func filtrarFavoritos(filename: String) -> [Pergunta]{
        let perguntas = load(filename: filename)
        var perguntasFiltradas: [Pergunta] = []
        
        for pergunta in perguntas{
            if pergunta.isFavorito == true{
                perguntasFiltradas.append(pergunta)
            }
        }
        return perguntasFiltradas
    }
}
