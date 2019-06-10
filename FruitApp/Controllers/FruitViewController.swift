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
    let dataSource : FruitDataSource
    var fruits : [Fruit] = []
    required init?(coder aDecoder: NSCoder) {
        self.dataSource = FruitDataSource(fruits: fruits)
        super.init(coder: aDecoder)
    }
    
    @IBAction func refreshBtnPressed(_ sender: UIBarButtonItem) {
        getData()
    }
}

//MARK - ViewController - invoke network call and set datasource
extension FruitViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        tableView.dataSource = dataSource
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.reloadData()
    }
    
}

//MARK - get data from api call

extension FruitViewController {
    func getData(){
        let url = URL(string: FruitAppConstants.url)!
        let request = NetworkRequest(url: url)
        //var executionTime : Double
        let startDate = Date()
        request.execute { [weak self] (data) in
            if let data = data {
                self?.decode(data)
            }
        }
        NetworkRequest.sendUsageStats(event: FruitAppConstants.eventLoad, data: "\(Date().timeIntervalSince(startDate) * 1000)")
        }
}

// MARK - JSON data decoder method

private extension FruitViewController {
    func decode(_ data: Data) {
        let decoder = JSONDecoder()
        do {
            let decoded = try decoder.decode(JSONData.self, from: data)
            dataSource.fruits = decoded.fruit
            tableView.reloadData()
        } catch let error {
            NetworkRequest.sendUsageStats(event: FruitAppConstants.eventError, data: error.localizedDescription)
            let title = FruitAppConstants.alertTitle
            let message = FruitAppConstants.alertMessage
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let dismissAction = UIAlertAction(title: title, style: .default, handler: nil)
            alertController.addAction(dismissAction)
            show(alertController, sender: nil)
        }
    }
}

//MARK - tableview Delegate methods

extension FruitViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: FruitAppConstants.fruitDetailsSegue, sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? FruitDetailViewController {
            if let indexPath = tableView.indexPathForSelectedRow {
                destinationVC.fruit = dataSource.fruits[indexPath.row]
                destinationVC.startDate = Date()
            }
        }
    }
}

