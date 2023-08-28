//
//  WebService.swift
//  HotCoffee
//
//  Created by Sydney Turner on 5/7/23.
//  Copyright © 2023 Mohammad Azam. All rights reserved.
//

import Foundation

let validStatus = 200...299

// Define potential error cases
enum NetworkError: Error {
    case decodingError
    case domainError
    case urlError
}

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
}

// of generic type and Codable
// responsible for making the request
// for a particular resource which in this case is the orders for the coffee
struct Resource<T: Codable> {
    let url: URL
    var httpMethod: HttpMethod = .get
    var body: Data? = nil
    
    init(url: URL) {
        self.url = url
    }
}

protocol WebService {
    func loadData(from url: URL) async throws -> Data
    func saveData(resource: Resource<Order?>) async throws -> Order
}

extension URLSession: WebService {
    func saveData(resource: Resource<Order?>) async throws -> Order {
        var request = URLRequest(url: resource.url)
        request.httpMethod = resource.httpMethod.rawValue
        request.httpBody = resource.body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        

        guard let (data, response) = try await URLSession.shared.data(for: request)
                as? (Data, HTTPURLResponse),
              validStatus.contains(response.statusCode) else {
            throw NetworkError.domainError
        }
        
        let order = try JSONDecoder().decode(Order.self, from: data)
        return order
    }
    
    func loadData(from url: URL) async throws -> Data {
        guard let (data, response) = try await URLSession.shared.data(from: url) as? (Data, HTTPURLResponse),
              validStatus.contains(response.statusCode) else {
            throw NetworkError.domainError
        }
        
        return data
    }
    
}

//class WebService {
//    func load<T>(resource: Resource<T>, completion: @escaping(Result<T, NetworkError>) -> Void) {
//        var request = URLRequest(url: resource.url)
//        request.httpMethod = resource.httpMethod.rawValue
//        request.httpBody = resource.body
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data, error == nil else {
//                completion(.failure(.domainError))
//                return
//            }
//            let result = try? JSONDecoder().decode(T.self, from: data)
//            if let result = result {
//                // have to do this bc result is eventually passed to the UI
//                DispatchQueue.main.async {
//                    completion(.success(result))
//                }
//            }
//            else {
//                completion(.failure(.decodingError))
//            }
//
//        }.resume()
//    }
//}
