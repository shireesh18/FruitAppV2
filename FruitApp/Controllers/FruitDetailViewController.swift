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
    var startDate : Date?
    
    override func viewDidLoad() {
        NetworkRequest.sendUsageStats(event: FruitAppConstants.eventDisplay, data: "\(Date().timeIntervalSince(startDate!) * 1000)")
        super.viewDidLoad()
        fruitLabel?.text = fruit?.type?.uppercased() ?? ""
        let price = fruit?.price ?? 0.0
        priceLabel?.text = "£ \(price/100) pence"
        let weight = fruit?.weight ?? 0.0
        weightLabel?.text = "\(weight/100) KG"
    }
  

}
