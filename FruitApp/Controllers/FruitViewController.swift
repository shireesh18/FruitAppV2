//
//  FruitViewController.swift
//  FruitApp
//
//  Created by user154691 on 6/7/19.
//  Copyright © 2019 Shireesh Marla. All rights reserved.
//

import UIKit

class FruitViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let dataSourceDelegate : FruitDataSource
    var fruits = [Fruit]()
    
    required init?(coder aDecoder: NSCoder) {
         fruits = [
            Fruit(type: "apple", price: 1.49, weight: 0.120),
            Fruit(type: "banana", price: 1.29, weight: 0.080),
            Fruit(type: "blueberry", price: 0.19, weight: 0.018),
            Fruit(type: "orange", price: 1.99, weight: 0.150),
            Fruit(type: "pear", price: 0.99, weight: 0.100),
            Fruit(type: "strawberry", price: 0.99, weight: 0.020),
            Fruit(type: "kumquat", price: 0.49, weight: 0.080),
            Fruit(type: "pitaya", price: 5.99, weight: 0.100),
            Fruit(type: "kiwi", price: 0.89, weight: 0.200)
        ]
        self.dataSourceDelegate = FruitDataSource(fruits: fruits)
        super.init(coder: aDecoder)
    }
}

//Mark - ViewController
extension FruitViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSourceDelegate
        tableView.delegate = self
        tableView.reloadData()
    }
}
//MARK - tableview Delegate methods
extension FruitViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       performSegue(withIdentifier: "fruitDetailsIdentifier", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? FruitDetailViewController {
            //let fruitDetailVC = destinationVC.viewControllers.first as? FruitDetailViewController{
            if let indexPath = tableView.indexPathForSelectedRow {
                destinationVC.fruit = fruits[indexPath.row]
            }
        }
       
    }
    
//    if let navigationController = segue.destination as? UINavigationController,
//    let editContactViewController = navigationController.viewControllers.first as? EditContactViewController {
//        editContactViewController.contact = contact
//    }
    
}
