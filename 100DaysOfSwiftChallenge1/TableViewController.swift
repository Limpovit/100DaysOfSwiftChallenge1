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
        
        title = "Countries flags"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flags.count
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.imageName = flags[indexPath.row]
            vc.countryName = countries[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        
    }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        
        cell.textLabel?.text = countries[indexPath.row]
        cell.imageView?.image = UIImage(named: flags[indexPath.row])
        return cell
    }
    
    func getCountryName(item: String) -> String {
        let firstIndex = item.index(after: item.firstIndex(of: "-")!)
        let lastIndex = item.firstIndex(of: ".")!
        let countryName = item[firstIndex..<lastIndex]
        
        return countryName.capitalized
        
    }
    
}

