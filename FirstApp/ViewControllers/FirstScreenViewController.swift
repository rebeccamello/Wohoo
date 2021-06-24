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
        startButton.backgroundColor = #colorLiteral(red: 0.3087054491, green: 0, blue: 0.6822325587, alpha: 1)
        startButton.setTitleColor(.white, for: .normal)
        startButton.setTitleColor(.gray, for: .highlighted)
    }
    
}
