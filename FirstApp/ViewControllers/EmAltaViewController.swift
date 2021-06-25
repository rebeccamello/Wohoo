////
////  ColletionViewController.swift
////  FirstApp
////
////  Created by Rebecca Mello on 24/06/21.
////
//
import UIKit
class EmAltaViewController: UIViewController {
    let images = ["capaAlta"]
    
    var perguntas:[Pergunta] = Pergunta.logos
    
    var selectedIndex: Int = 0
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

class EmAltaPostCell: UICollectionViewCell{
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var question: UILabel!
    
    override func awakeFromNib() {
        background.layer.cornerRadius = 12
        image.layer.cornerRadius = 12
    }
    
}
extension EmAltaViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return perguntas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "postCell", for: indexPath) as! EmAltaPostCell
        cell.image.image = UIImage()
        cell.question.text = perguntas[indexPath.row].nomePergunta
        return cell
    }
    
}

extension EmAltaViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? PopUpViewController
        vc?.pergunta = perguntas[selectedIndex]
    }
}
