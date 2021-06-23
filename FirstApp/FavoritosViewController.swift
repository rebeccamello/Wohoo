
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
    
    var favoritosTitulo: UILabel = UILabel(frame: .zero)
    var fotoLogoFavoritos: UIImageView = UIImageView(image: #imageLiteral(resourceName: "logoWohoo.png"))
    var perguntas: [Pergunta] = Pergunta.populares
    let rowIdentifier = "rowIdentifier"
    let readContent = ReadContent()
 
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.addSubview(favoritosTitulo)
        view.addSubview(fotoLogoFavoritos)
        
        favoritosTitulo.font = UIFont.systemFont(ofSize: 27.0, weight: .semibold)
        favoritosTitulo.text = "Em Alta"
        favoritosTitulo.translatesAutoresizingMaskIntoConstraints = false
        favoritosTitulo.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 110).isActive = true
        favoritosTitulo.topAnchor.constraint(equalTo: view.topAnchor, constant: 85).isActive = true
        

        fotoLogoFavoritos.translatesAutoresizingMaskIntoConstraints = false
        fotoLogoFavoritos.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 120).isActive = true
        fotoLogoFavoritos.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        fotoLogoFavoritos.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35).isActive = true
        fotoLogoFavoritos.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -176).isActive = true
        fotoLogoFavoritos.heightAnchor.constraint(equalToConstant: 40).isActive = true
        fotoLogoFavoritos.widthAnchor.constraint(equalToConstant: 180).isActive = true
        
        
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


