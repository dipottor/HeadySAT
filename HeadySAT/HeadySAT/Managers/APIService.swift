//
//  APIService.swift
//  HeadySAT
//
//  Created by Ravindra Kumbhar on 16/05/19.
//  Copyright © 2019 Ravindra Kumbhar. All rights reserved.
//

/*
 Class utility to handle web-api
 */

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}

enum ServiceError: Error {
    case unknown
    case requestFailed(response: URLResponse, data: Data?)
}


protocol APIServiceProtocol {
    func fetchCategories(by url: URL, completion: @escaping (Result<HeadyModels>) -> ())
}


class APIService: APIServiceProtocol {
    
     // MARK: - DataTask
    func fetchCategories(by url: URL, completion: @escaping (Result<HeadyModels>) -> ()) {
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let response = response as? HTTPURLResponse, let data = data else {
                completion(.failure(error ?? ServiceError.unknown))
                return
            }
            
            guard 200..<400 ~= response.statusCode else {
                completion(.failure(ServiceError.requestFailed(response: response, data: data)))
                return
            }
            
            do {
                 let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(HeadyModels.self, from: data)
                print(responseModel)
                 completion(.success(responseModel))
                
            } catch let error {
                completion(.failure(error))
            }
        }
        dataTask.resume()
    }
    
}


