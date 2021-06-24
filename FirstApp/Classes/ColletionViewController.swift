////
////  ColletionViewController.swift
////  FirstApp
////
////  Created by Rebecca Mello on 24/06/21.
////
//
import UIKit
class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    let images = ["capaLogo", "capaMarcas", "capaServico"]
    let questions = ["Qual a importância do logo para minha empresa?", "Qual a importância de se ter um propósito para criação de uma marca?", "Quanto custa pra fazer um logo para minha empresa?"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "postCell", for: indexPath) as! PostCell
        cell.image.image = UIImage(named: images[indexPath.row])
        cell.question.text = questions[indexPath.row]
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
