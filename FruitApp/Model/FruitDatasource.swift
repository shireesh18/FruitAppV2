//
//  FruitDatasource.swift
//  FruitApp
//
//  Created by user154691 on 6/7/19.
//  Copyright © 2019 Shireesh Marla. All rights reserved.
//

import UIKit

class FruitDataSource : NSObject{
    var fruits : [Fruit]
     init(fruits : [Fruit]) {
        self.fruits = fruits
    }
}

//MARK - tableview Datasource methods
extension FruitDataSource : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FruitCell.self), for: indexPath) as! FruitCell
        let fruit = fruits[indexPath.row]
        cell.textLabel?.text = fruit.type
        cell.textLabel?.textAlignment = .center
        return cell
    }
}


