//
//  Network.swift
//  AppCats
//
//  Created by Juan Sebastian Florez Saavedra on 24/05/20.
//  Copyright © 2020 Juan Sebastian Florez Saavedra. All rights reserved.
//

import Foundation
import Combine

class Network {
    
    
    func request<T: Codable>(endPoint: String, method: Method, completion: @escaping((Result<T, NetworkError>) -> Void))
    {
        guard let url = URL(string: endPoint) else {
            completion(.failure(.internalError) ); return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "\(method)"
        request.allHTTPHeaderFields = ["Content-Type": "application/json"]
        
        call(with: request, completion: completion)
    }
    
    
    private func call<T: Codable>(with request: URLRequest, completion: @escaping ((Result<T, NetworkError>) -> Void)) {
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                completion(.failure(.serverError(errorDescripcion: error?.localizedDescription)))
                return
            }
            do {
                guard let data = data else {
                    completion(.failure(.serverError(errorDescripcion: "Ocurrió un error")))
                    return
                }
                let object = try JSONDecoder().decode(T.self, from: data)
                 completion(Result.success(object))
            } catch {
                completion(Result.failure(.parsingError))
            }
        }
        dataTask.resume()
    }
    
    //MARK: Combine
    
    func getRequest(path: String, method: Method) -> URLRequest {
        
        guard let url = URL(string: path) else {
            preconditionFailure("Bad URL")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "\(method)"
        request.allHTTPHeaderFields = ["Content-Type": "application/json"]
        
        return request
    }
    
    func call<T: Codable>(path: String, method: Method) -> AnyPublisher<T, NetworkError> {
        let urlRequest = getRequest(path: path, method: method)
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .mapError { _ in NetworkError.serverError(errorDescripcion: "error") }
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { _ in NetworkError.parsingError }
            .eraseToAnyPublisher()
    }
}
