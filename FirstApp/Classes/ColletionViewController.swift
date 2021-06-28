////
////  ColletionViewController.swift
////  FirstApp
////
////  Created by Rebecca Mello on 24/06/21.
////
//
import UIKit
class CollectionViewController: UIViewController {
    let images = ["capaLogo", "capaMarcas", "capaServico"]

    var perguntas:[Pergunta] = Pergunta.logos
    
    var selectedIndex: Int = 0
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var segmentedOutlet: UISegmentedControl!
    @IBAction func segmentedControl(_ sender: Any) {
        
        let index = self.segmentedOutlet.selectedSegmentIndex
        if index == 0 {
            self.perguntas = Pergunta.logos
        }
        else if index == 1{
            self.perguntas = Pergunta.marcas
        }
        else{
            self.perguntas = Pergunta.servicos
        }
        
        collectionView.reloadData()
//        collectionView.reloadItems(at: collectionView.indexPathsForVisibleItems)
    }
    
    @IBAction func actPopUp() -> Void{
        guard let vc = storyboard?.instantiateViewController(identifier: "idPopUp") as? PopUpViewController else {return}
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
}

class PostCell: UICollectionViewCell{
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var question: UILabel!
    
    override func awakeFromNib() {
        background.layer.cornerRadius = 12
        image.layer.cornerRadius = 12
    }
    
}
extension CollectionViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return perguntas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "postCell", for: indexPath) as! PostCell
        cell.image.image = UIImage(named: images[self.segmentedOutlet.selectedSegmentIndex])
        cell.question.text = perguntas[indexPath.row].nomePergunta
        return cell
    }
}

extension CollectionViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
//        self.performSegue(withIdentifier: "conexao", sender: indexPath.row)
        
//        let vc = UINavigationController(rootViewController: PopUpViewController())
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? PopUpViewController
        vc?.pergunta = perguntas[selectedIndex]
    }
}


