//
//  ViewController.swift
//  Project1-StormViewer
//
//  Created by Kush, Ryan on 11/25/18.
//  Copyright © 2018 Kush, Ryan. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true

        let fileManager = FileManager.default
        let path = Bundle.main.resourcePath
        let items = try! fileManager.contentsOfDirectory(atPath: path!)

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
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewController = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            viewController.pictureName = pictures[indexPath.row]
            navigationController?.pushViewController(viewController, animated: true)
        }
    }

}

