//
//  FetchCatFactsUseCase.swift
//  AppCats
//
//  Created by Juan Sebastian Florez Saavedra on 25/05/20.
//  Copyright © 2020 Juan Sebastian Florez Saavedra. All rights reserved.
//

import Foundation
import Combine

class FetchCatFactsUseCase: FetchCatFactsUseCaseProtocol {
    
    
    private var factsRepository: FactsRepositoryProtocol
    
    
    init(factsRepository: FactsRepositoryProtocol) {
        self.factsRepository = factsRepository
    }
    
    func execute(completion: @escaping (Result<CatFact, NetworkError>) -> Void) {
        factsRepository.getRandomFacts(completion: completion)
    }
    
    //MARK: Combine
    
    func execute() -> AnyPublisher<CatFact, NetworkError> {
        return factsRepository.getRandomFacts()
    }
    
}
