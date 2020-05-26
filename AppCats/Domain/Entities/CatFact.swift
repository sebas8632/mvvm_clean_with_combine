//
//  CatFact.swift
//  AppCats
//
//  Created by Juan Sebastian Florez Saavedra on 17/05/20.
//  Copyright © 2020 Juan Sebastian Florez Saavedra. All rights reserved.
//

import Foundation

struct CatFact: Codable {
    
    
    var id: String
    var version: Double
    var text: String
    var type: String
    var used: Bool
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case version = "__v"
        case text = "text"
        case type = "type"
        case used = "used"
    }
}
