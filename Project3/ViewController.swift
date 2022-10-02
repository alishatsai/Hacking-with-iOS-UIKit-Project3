//
//  ViewController.swift
//  Project1
//
//  Created by Alisha on 2022/9/7.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Storm Viewer"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path).sorted()

        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        print(pictures)
    
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = pictures[indexPath.row]
        content.textProperties.font = UIFont(name: "Helvetica-Light", size: 25)!
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            vc.x = indexPath.row
            vc.y = pictures.count
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

