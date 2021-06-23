//
//  PopUpViewController.swift
//  FirstApp
//
//  Created by Carolina Ortega on 6/4/21.
//

import UIKit

class PopUpViewController: UIViewController, UIGestureRecognizerDelegate {
    
    let mainUrl = Bundle.main.url(forResource: "data", withExtension: "json")
    

    @IBOutlet weak var horario: UILabel!
    @IBOutlet weak var botaoFavoritos: UIButton!
    @IBOutlet weak var resposta: UILabel!
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var viewPerguntas: UIView!
    
    let heartFill = UIImage(systemName: "heart.fill")
    let heart = UIImage(systemName: "heart")
    var listaNomes = ["Larissa","Sarah","Enzo","Catarina","Levi","André","Cecília","Henrique","Evelyn","Igor","Eduardo","João Vitor","Stephany","Helena","Yuri","Isaac","Arthur","Derek","Helena","Leonardo","Fernando","Gustavo","Davi Lucca","Ryan","Isadora","Maria Luiza","Sarah","Camila","Vicente","Paulo","Luiz Otávio","Carolina","Gabriele","Francielly"]



    var pergunta : Pergunta?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.backItem?.title = "Back"

        
//        botaoVoltar.addTarget(self, action: #selector(funcaoVoltar), for: .touchUpInside)
        
        botaoFavoritos.addTarget(self, action: #selector(botaoFav), for: .touchUpInside)
//        self.definesPresentationContext = true
        resposta.text = pergunta?.resposta
        titulo.text = pergunta?.nomePergunta
        horario.text = " \(listaNomes.randomElement()!) \n há \(Int.random(in: 2...59)) minutos"
        
//        if let perguntaUnwrap = pergunta{
//            if perguntaUnwrap.isFavorito{
//                botaoFavoritos.setTitle(" Amei!", for: .normal)
//                botaoFavoritos.setImage(heartFill, for: .normal)
//
//            } else{
//                botaoFavoritos.setImage(heart, for: .normal)
//                botaoFavoritos.setTitle(" ", for: .normal)
//            }
//
//        }

        
    }
    @objc func botaoFav() {
            if !botaoFavoritos.isSelected{
                botaoFavoritos.setTitle(" Curtido!", for: .normal)
                botaoFavoritos.setImage(heartFill, for: .normal)

            } else{
                botaoFavoritos.setImage(heart, for: .normal)
                botaoFavoritos.setTitle(" Curtir", for: .normal)
            }
            botaoFavoritos.isSelected = !botaoFavoritos.isSelected


        }
//    func writeToFile (path: URL, novaPergunta: Pergunta) {
//        do {
//            let encoder = JSONEncoder()
//            encoder.outputFormatting = .prettyPrinted
//            let jsonData = try encoder.encode(novaPergunta)
//            try jsonData.write(to: path)
//        } catch {
//
//        }
//    }
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

