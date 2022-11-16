//
//  File.swift
//  YapeCuisineRecipes
//
//  Created by Rone Shender Loza Aliaga on 12/11/22.
//

import Foundation
import Combine

struct NetworkDataManager: DataManagerExchangeable {
    
    private func task<T: Codable>(request: DataManagerExchangeRequest,
                                  completion: @escaping (Result<T, HomeDataManagerError>) -> ()) {
        var urlComponents = URLComponents()
        urlComponents.host = request.host
        urlComponents.scheme = request.scheme
        urlComponents.path = request.path
        urlComponents.queryItems = request.query.compactMap { URLQueryItem(name: $0.key, value: $0.value)}
        guard let url = urlComponents.url,
              !request.host.isEmpty else {
            completion(.failure(HomeDataManagerError.urlMalFormed))
            return
        }
        let data = (request.jsonBody.isEmpty ?
                    nil :
                        try? JSONSerialization.data(withJSONObject: request.jsonBody, options: []))
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method
        urlRequest.httpBody = data
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data,
                  let object = try? JSONDecoder().decode(T.self, from: data) else {
                      completion(.failure(HomeDataManagerError.decodeTypeFailure))
                      return
                  }
            completion(.success(object))
        }.resume()
    }
    
    func fetch<T: Codable>(request: DataManagerExchangeRequest,
                         completion: @escaping (Result<T, HomeDataManagerError>) -> ()) {
        self.task(request: request, completion: completion)
    }
}
