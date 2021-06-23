//
//  Particle.swift
//  FirstApp
//
//  Created by Gabriele Namie on 03/06/21.
//

import Foundation
import UIKit

class Particle: UITableViewCell {
    lazy var nomePergunta: UILabel = {
        let nome = UILabel(frame: .zero)

        nome.translatesAutoresizingMaskIntoConstraints = false
        nome.numberOfLines = 0
        nome.preferredMaxLayoutWidth = 326
        nome.lineBreakMode = .byWordWrapping
        nome.adjustsFontForContentSizeCategory = false
        nome.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        
        return nome
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {

            super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(nomePergunta)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func setup(nomePergunta: String){
        self.nomePergunta.text = nomePergunta
    }
}
