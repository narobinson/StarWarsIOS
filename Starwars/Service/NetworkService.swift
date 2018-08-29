//
//  NetworkService.swift
//  Starwars
//
//  Created by Admin on 7/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

final class NetworkService {
    
    static let shared = NetworkService()
    private init(){ }
    
    private let urlString = "https://raw.githubusercontent.com/phunware-services/dev-interview-homework/master/feed.json"
    private let decoder = JSONDecoder()
    
    typealias ItemHandler = ([Item], ServiceError?)->Void
    
    func getItems(completion: @escaping ItemHandler){
        
        guard let url = URL(string: urlString) else {
            completion([], .badRequest)
            return
        }
        
        URLSession.shared.dataTask(with: url){ data, response, error in
            
            var items: [Item] = []
            var _error: ServiceError?
            defer { completion(items, _error) }
            
            if error != nil {
                _error = .serverError
                return
            }
            
            guard let serverData = data else {
                _error = .noData
                return
            }
            do {
                items = try self.decoder.decode(Items.self, from: serverData)
            }catch{
                _error = .serverError
                print(error.localizedDescription)
            }
            }.resume()
    }
}

