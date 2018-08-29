//
//  ServiceError.swift
//  Starwars
//
//  Created by Admin on 7/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

enum ServiceError: Error {
    
    case noData
    case badRequest
    case serverError
    case networkError
    case unknown
}
