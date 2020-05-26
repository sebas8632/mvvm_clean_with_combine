//
//  ViewController.swift
//  AppCats
//
//  Created by Juan Sebastian Florez Saavedra on 17/05/20.
//  Copyright © 2020 Juan Sebastian Florez Saavedra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var fetchCatFactsUseCase: FetchCatFactsUseCaseProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        useCasesInitiliazer()
        getFact()
        // Do any additional setup after loading the view.
        
    }

    private func useCasesInitiliazer() {
        let factsRepository = FactsRepository()
        fetchCatFactsUseCase = FetchCatFactsUseCase(factsRepository: factsRepository)

    }
    private func getFact() {
        
        guard let useCase = self.fetchCatFactsUseCase else {
            print("Has ocurred an error")
            return
        }
        
        useCase.execute(completion: { (result) in
            
            switch result   {
            case .failure(let error):
                self.errorManager(error: error)
            
            case .success(let catFact):
                print("id: \(catFact.id),\n version: \(catFact.version),\n text: \(catFact.text), \n type: \(catFact.type), \n used: \(catFact.used)")
                
            }
            
        })
    }

    private func errorManager(error: NetworkError) {
     
        switch error {
        case .internalError:
            print("Something was wrong")
        case .parsingError:
            print("Has ocurred an error parsing the data")
        case .serverError(let errorServer):
            print("\(String(describing: errorServer))")
        default:
            print("Has occurred an error unexpected")
        }
        
    }
}

