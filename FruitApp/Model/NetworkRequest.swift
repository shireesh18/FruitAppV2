//
//  NetworkRequest.swift
//  FruitApp
//
//  Created by user154691 on 6/8/19.
//  Copyright © 2019 Shireesh Marla. All rights reserved.
//

import Foundation

class NetworkRequest {
    let session = URLSession(configuration: .ephemeral, delegate: nil, delegateQueue: .main)
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func execute(withCompletion completion: @escaping (Data?) -> Void) {
        let task = session.dataTask(with: url, completionHandler: { (data: Data?, _, _) -> Void in
            completion(data)
        })
        task.resume()
    }
}
