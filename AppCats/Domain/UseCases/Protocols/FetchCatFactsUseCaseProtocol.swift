//
//  FetchCatFactsUseCaseProtocol.swift
//  AppCats
//
//  Created by Juan Sebastian Florez Saavedra on 25/05/20.
//  Copyright © 2020 Juan Sebastian Florez Saavedra. All rights reserved.
//

import Foundation

protocol FetchCatFactsUseCaseProtocol {
        
    func execute(completion: @escaping (Result<CatFact, NetworkError>) -> Void)
}
