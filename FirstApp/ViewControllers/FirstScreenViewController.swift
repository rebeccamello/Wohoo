//
//  FirstScreen.swift
//  FirstApp
//
//  Created by Rebecca Mello on 23/06/21.
//

import UIKit

class FirstScreenViewController: UIViewController{
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    

    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = 14
        startButton.clipsToBounds = true
        startButton.backgroundColor = #colorLiteral(red: 0.9251682162, green: 0.9253232479, blue: 0.9251478314, alpha: 1)
        startButton.setTitleColor(#colorLiteral(red: 0.3467412889, green: 0, blue: 0.710596323, alpha: 1), for: .normal)
    }
    
}
