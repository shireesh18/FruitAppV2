//
//  FruitDetailViewController.swift
//  FruitApp
//
//  Created by user154691 on 6/7/19.
//  Copyright © 2019 Shireesh Marla. All rights reserved.
//

import UIKit

class FruitDetailViewController: UIViewController {

    @IBOutlet weak var fruitLabel: UILabel?
    
    @IBOutlet weak var priceLabel: UILabel?
    
    @IBOutlet weak var weightLabel: UILabel?
    
    var fruit : Fruit?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fruitLabel?.text = fruit?.type ?? ""
        let price = fruit?.price ?? 0.0
        priceLabel?.text = "£ \(price/100)"
        let weight = fruit?.weight ?? 0.0
        weightLabel?.text = "\(weight/100) KG"
	       
    }
  

}
