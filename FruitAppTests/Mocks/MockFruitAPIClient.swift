//
//  MockFruitAPIClient.swift
//  FruitAppTests
//
//  Created by user154691 on 6/11/19.
//  Copyright © 2019 Shireesh Marla. All rights reserved.
//

//import Foundation
@testable import FruitApp

class MockFruitAPIClient {
    var shouldReturnError = false
    var getDataWasCalled = false
    enum MockServiceError : Error{
        case getData
    }
    func reset(){
         shouldReturnError = false
         getDataWasCalled = false
    }
    convenience init(){
        self.init(false)
    }
    init(_ shouldReturnError : Bool){
        self.shouldReturnError = shouldReturnError
    }
    let mockFruitResponse : [String : Any] = [
        "fruit" :  [
            [
                "type":"apple",
                "price":129,
                "weight":120
            ],
            [
                "type":"banana",
                "price":129,
                "weight":80
            ],
            [
                "type":"blueberry",
                "price":19,
                "weight":18
            ],
            [
                "type":"orange",
                "price":199,
                "weight":150
            ],
            [
                "type":"pear",
                "price":99,
                "weight":100
            ],
            [
                "type":"strawberry",
                "price":99,
                "weight":20
            ],
            [
                "type":"kumquat",
                "price":49,
                "weight":80
            ],
            [
                "type":"pitaya",
                "price":599,
                "weight":100
            ],
            [
                "type":"kiwi",
                "price":89,
                "weight":200
            ],
      ]
    ]
}
extension MockFruitAPIClient {
    func getData(withCompletion completion: @escaping ([String : Any]?, Error?) -> Void){
        getDataWasCalled = true
        if shouldReturnError {
            completion(nil, MockServiceError.getData)
        }else {
            completion(mockFruitResponse, nil)
        }
    }
}

