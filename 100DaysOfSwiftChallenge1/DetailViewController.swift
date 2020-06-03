//
//  DetailViewController.swift
//  100DaysOfSwiftChallenge1
//
//  Created by HexaHack on 03.06.2020.
//  Copyright © 2020 HexaHack. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var flagView: UIImageView!
    
    var imageName: String?
    var countryName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = countryName
        
        if let imageToLoad = imageName {
            flagView.image = UIImage(named: imageToLoad)
        }        
    }
}
