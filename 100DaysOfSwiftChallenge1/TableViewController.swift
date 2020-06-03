//
//  ViewController.swift
//  100DaysOfSwiftChallenge1
//
//  Created by HexaHack on 03.06.2020.
//  Copyright © 2020 HexaHack. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var flags = [String]()
    var countries = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("flags_") {
                flags.append(item)
                countries.append(getCountryName(item: item))
            }
        }
    }


}

