
//
//  FavoritosViewController.swift
//  FirstApp
//
//  Created by Carolina Ortega on 6/4/21.
//

import Foundation
import UIKit

class FavoritosViewController : UIViewController {
    @IBOutlet weak var tableFavoritos: UITableView!
    
    var perguntas: [Pergunta] = Pergunta.populares
    let rowIdentifier = "rowIdentifier"
    let readContent = ReadContent()
 
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        self.tableFavoritos.rowHeight = 70
        tableFavoritos.delegate = self
        tableFavoritos.dataSource = self
        tableFavoritos.register(Particle.self, forCellReuseIdentifier: rowIdentifier)
    }
}

extension FavoritosViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return perguntas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: rowIdentifier, for: indexPath) as!
            Particle
        cell.setup(nomePergunta: perguntas[indexPath.row].nomePergunta)
        
        return cell
    }

}

extension FavoritosViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = PopUpViewController()
        vc.pergunta = perguntas[indexPath.row]
        
        self.performSegue(withIdentifier: "conexao2", sender: indexPath.row)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? PopUpViewController
        vc?.pergunta = perguntas[sender as? Int ?? 0]
    }
}


