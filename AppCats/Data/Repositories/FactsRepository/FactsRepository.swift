//
//  FactsRepository.swift
//  AppCats
//
//  Created by Juan Sebastian Florez Saavedra on 17/05/20.
//  Copyright © 2020 Juan Sebastian Florez Saavedra. All rights reserved.
//

import Foundation

class FactsRepository: FactsRepositoryProtocol {
    
    
    private var network: Network
    
    init() {
        network = Network()
    }
    
    func getRadomFacts(completion: @escaping ((Result<CatFact, NetworkError>) -> Void)) {
        
        let baseUrl = AppEndpoints.baseUrl
        let endPoint = Endpoint.random.rawValue
        
        let path: String = "\(baseUrl)\(endPoint)"
        
        network.request(endPoint: path, method: .GET, completion: completion)
        
    }
    
    
    
}
