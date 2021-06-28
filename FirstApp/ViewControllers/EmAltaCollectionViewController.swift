//
//  EmAltaCollectionViewController.swift
//  FirstApp
//
//  Created by Rebecca Mello on 25/06/21.
//

import UIKit
class EmAltaCollectionViewController: UIViewController {
    let images = ["capaAlta"]
    
    var perguntas:[Pergunta] = Pergunta.populares
    
    var selectedIndex: Int = 0
    
    @IBOutlet weak var EACollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        EACollectionView.dataSource = self
        EACollectionView.delegate = self
    }
}

class EmAltaPostCell: UICollectionViewCell{
    @IBOutlet weak var bg: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var quest: UILabel!
    
    override func awakeFromNib() {
        bg.layer.cornerRadius = 12
        img.layer.cornerRadius = 12
    }
}

extension EmAltaCollectionViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return perguntas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EmAltaPostCell", for: indexPath) as! EmAltaPostCell
        cell.img.image = UIImage(named: images[0])
        cell.quest.text = perguntas[indexPath.row].nomePergunta
        return cell
    }
}

extension EmAltaCollectionViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "popUpviewcontroller") as! PopUpViewController
        viewController.pergunta = perguntas[selectedIndex]
        self.navigationController!.pushViewController(viewController, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? PopUpViewController
        vc?.pergunta = perguntas[sender as? Int ?? 0]
    }
}
