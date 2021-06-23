//
//  ViewController.swift
//  FirstApp
//
//  Created by Carolina Ortega on 5/31/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var tableView: UITableView!
  
    var perguntas:[Pergunta] = Pergunta.logos
    let rowIdentifier = "rowIdentifier"
    let readContent = ReadContent()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true
        
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

