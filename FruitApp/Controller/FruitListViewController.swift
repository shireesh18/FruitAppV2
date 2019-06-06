//
//  ViewController.swift
//  FruitApp
//
//  Created by user154691 on 6/6/19.
//  Copyright © 2019 Shireesh Marla. All rights reserved.
//

import UIKit

class FruitListViewController: UITableViewController {
    
    let fruitArray = ["Apple", "Mango", "Orange"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruitArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FruitCell", for: indexPath)
        	cell.textLabel?.text = fruitArray[indexPath.row]
        return cell
    }
    
    //MARK - Tableview Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(fruitArray[indexPath.row])
    }


}

