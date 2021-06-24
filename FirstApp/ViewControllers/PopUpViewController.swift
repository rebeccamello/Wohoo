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
    @IBOutlet weak var resposta: UILabel!
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var viewPerguntas: UIView!
    
    let heartFill = UIImage(systemName: "heart.fill")
    let heart = UIImage(systemName: "heart")
    var listaNomes = ["Larissa","Sarah","Enzo","Catarina","Levi","André","Cecília","Henrique","Evelyn","Igor","Eduardo","João Vitor","Stephany","Helena","Yuri","Isaac","Arthur","Derek","Helena","Leonardo","Fernando","Gustavo","Davi Lucca","Ryan","Isadora","Maria Luiza","Sarah","Camila","Vicente","Paulo","Luiz Otávio","Carolina","Gabriele","Francielly"]



    var pergunta : Pergunta?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        self.navigationController?.navigationBar.backItem?.title = "Back"
//        self.definesPresentationContext = true
        resposta.text = pergunta?.resposta
        titulo.text = pergunta?.nomePergunta
        horario.text = " \(listaNomes.randomElement()!) \n há \(Int.random(in: 2...59)) minutos"
    }
}

