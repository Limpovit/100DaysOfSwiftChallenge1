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
        
        navigationItem.rightBarButtonItem  = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(sharedTapped))
        
    }
    
    @objc func sharedTapped() {
     guard let image = flagView.image else {
         print("Image not found")
         return
     }
        
        let ac = UIActivityViewController(activityItems: [image, countryName], applicationActivities: [])
        
        ac.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(ac, animated: true)
        
    }
    
}
