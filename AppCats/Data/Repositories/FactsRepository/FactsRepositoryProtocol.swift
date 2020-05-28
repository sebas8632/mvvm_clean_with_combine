//
//  FactsRepositoryProtocol.swift
//  AppCats
//
//  Created by Juan Sebastian Florez Saavedra on 17/05/20.
//  Copyright © 2020 Juan Sebastian Florez Saavedra. All rights reserved.
//

import Foundation
import Combine

protocol FactsRepositoryProtocol {
    
    func getRandomFacts(completion: @escaping((Result<CatFact, NetworkError>) -> Void))
    
    func getRandomFacts() -> AnyPublisher<CatFact, NetworkError>
}
