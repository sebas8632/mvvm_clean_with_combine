//
//  FactsRepositoryProtocol.swift
//  AppCats
//
//  Created by Juan Sebastian Florez Saavedra on 17/05/20.
//  Copyright © 2020 Juan Sebastian Florez Saavedra. All rights reserved.
//

import Foundation


protocol FactsRepositoryProtocol {
    
    func getRadomFacts(completion: @escaping((Result<CatFact, NetworkError>) -> Void))
    
}
