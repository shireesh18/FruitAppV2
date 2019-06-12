//
//  Fruit.swift
//  FruitApp
//
//  Created by user154691 on 6/7/19.
//  Copyright © 2019 Shireesh Marla. All rights reserved.
//

struct JSONData : Decodable {
    let fruit : [Fruit]
    private enum CodingKeys: String, CodingKey {
        case fruit = "fruit"
    }
}
struct Fruit : Decodable {
       let type: String?
       let price : Float?
       let weight : Float?
    
    private enum CodingKeys: String, CodingKey {
        case type  = "type"
        case price = "price"
        case weight = "weight"
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        weight         = try container.decodeIfPresent(Float.self, forKey: .weight) ?? 0.0
        price        = try container.decodeIfPresent(Float.self, forKey: .price) ?? 0.0
        type           = try container.decodeIfPresent(String.self, forKey: .type) ?? ""
    }
}
