//
//  ViewController.swift
//  FirstApp
//
//  Created by Carolina Ortega on 5/31/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var perguntasTitulo: UILabel = UILabel(frame: .zero)
    var favoritosTitulo: UILabel = UILabel(frame: .zero)
    var fotoLogo: UIImageView = UIImageView(image: #imageLiteral(resourceName: "logoWohoo.png"))
    @IBOutlet weak var tableView: UITableView!
  
    var perguntas:[Pergunta] = Pergunta.logos
    let rowIdentifier = "rowIdentifier"
    let readContent = ReadContent()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(perguntasTitulo)
        view.addSubview(fotoLogo)

        perguntasTitulo.text = "Respostas"
        perguntasTitulo.font = UIFont.systemFont(ofSize: 27.0, weight: .semibold)
        perguntasTitulo.translatesAutoresizingMaskIntoConstraints = false
        perguntasTitulo.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 97).isActive = true
        perguntasTitulo.topAnchor.constraint(equalTo: view.topAnchor, constant: 118).isActive = true
        
        
        fotoLogo.translatesAutoresizingMaskIntoConstraints = false
        fotoLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 120).isActive = true
        fotoLogo.topAnchor.constraint(equalTo: view.topAnchor, constant: 112).isActive = true
        fotoLogo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35).isActive = true
        fotoLogo.trailingAnchor.constraint(equalTo: perguntasTitulo.leadingAnchor, constant: -10).isActive = true
        fotoLogo.heightAnchor.constraint(equalToConstant: 40).isActive = true
        fotoLogo.widthAnchor.constraint(equalToConstant: 180).isActive = true
        
        
        self.tableView.rowHeight = 70
       
        tableView.dataSource = self
        tableView.register(Particle.self, forCellReuseIdentifier: rowIdentifier)
        
        tableView.delegate = self
        
        segmentedControl.addAction(UIAction(handler:{ [weak self] _ in
            print(self?.segmentedControl.selectedSegmentIndex)
            if let index = self?.segmentedControl.selectedSegmentIndex{
                if index == 0 {
                    self?.perguntas = Pergunta.logos
                }
                else if index == 1{
                    self?.perguntas = Pergunta.marcas
                }
                else{
                    self?.perguntas = Pergunta.servicos
                }
                self?.tableView.reloadData()
             
              
            }
       
        }), for: .valueChanged)
        
}
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(perguntas.count)
        return perguntas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: rowIdentifier, for: indexPath) as!
            Particle
        cell.setup(nomePergunta: perguntas[indexPath.row].nomePergunta)
        
        return cell
    }

}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = PopUpViewController()
        vc.pergunta = perguntas[indexPath.row]
        
    
        self.performSegue(withIdentifier: "conexao", sender: indexPath.row)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? PopUpViewController
        vc?.pergunta = perguntas[sender as? Int ?? 0]
    }
}

