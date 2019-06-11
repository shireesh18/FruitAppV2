//
//  FruitAppTests.swift
//  FruitAppTests
//
//  Created by user154691 on 6/6/19.
//  Copyright © 2019 Shireesh Marla. All rights reserved.
//

import XCTest
@testable import FruitApp

class FruitAppTests: XCTestCase {
    
    var fruitAPIClient : MockFruitAPIClient?

    override func setUp() {
        fruitAPIClient = MockFruitAPIClient()
    }

    func testPerformanceFruitAPI(){
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            let request = NetworkRequest(url: URL(string : FruitAppConstants.url)!)
            request.execute { [weak self] (data) in
                if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        _ = try decoder.decode(JSONData.self, from: data)
                    }catch let error {
                        print(error.localizedDescription )
                    }
                }
            }
            
        }
    }
    
    func testGetFruitList(){
        let expectation =  self.expectation(description: "FruitList Response parse expectation")
        //uncomment the below to throw error from MockStub
        //fruitAPIClient?.shouldReturnError = true
        fruitAPIClient!.getData { (json, error) in
            XCTAssertNil(error)
            guard let fruits = json else {
                XCTFail()
                return
            }
            do{
                guard let fruitList = fruits["fruit"] else{
                    XCTFail()
                    return
                }
                let jsonData = try JSONSerialization.data(withJSONObject: fruitList, options: [])
                let fruits = try JSONDecoder().decode([Fruit].self, from: jsonData)
                XCTAssertNotNil(fruits)
                XCTAssertTrue(fruits.count == 9 )
                var i = 0
                repeat{
                     XCTAssertNotNil(fruits[i])
                    XCTAssertNotNil(fruits[i].type)
                    XCTAssertNotNil(fruits[i].price)
                    XCTAssertNotNil(fruits[i].weight)
                    i += 1
                }while i < fruits.count
               
                expectation.fulfill()
            }catch {
                XCTFail(error.localizedDescription)
            }
           self.waitForExpectations(timeout: 10.0, handler: nil)
        }
    }
}
