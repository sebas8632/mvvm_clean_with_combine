//
//  NetworkError.swift
//  AppCats
//
//  Created by Juan Sebastian Florez Saavedra on 17/05/20.
//  Copyright © 2020 Juan Sebastian Florez Saavedra. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case internalError
    case serverError(errorDescripcion: String?)
    case parsingError
}
