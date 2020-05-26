//
//  ApiEndpoints.swift
//  AppCats
//
//  Created by Juan Sebastian Florez Saavedra on 17/05/20.
//  Copyright © 2020 Juan Sebastian Florez Saavedra. All rights reserved.
//

import Foundation

 class AppEndpoints {
    
    public static let baseUrl = "https://cat-fact.herokuapp.com"
    
    init() {
        
    }
}

enum Method: String {
    case GET
    case POST
}

enum Endpoint: String {
    case all = ""
    case random = "/facts/random"
    case factById = "/facts"
}
