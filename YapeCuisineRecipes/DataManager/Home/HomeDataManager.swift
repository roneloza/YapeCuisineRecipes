//
//  HomeDataManager.swift
//  YapeCuisineRecipes
//
//  Created by Rone Shender Loza Aliaga on 12/11/22.
//

import Foundation
import Combine

protocol HomeDataManagerExchangeable {
    
    func getTopReceips(request: DataManagerExchangeRequest) -> Future<ReceipeTopExchangeResponse, HomeDataManagerError>
}

struct HomeDataManager: HomeDataManagerExchangeable {
    
    let dataManager: DataManagerExchangeable
    
    func getTopReceips(request: DataManagerExchangeRequest) -> Future<ReceipeTopExchangeResponse, HomeDataManagerError> {
        Future { promise in
            self.dataManager.fetch(request: request) { (result: Result<SearchResponse, HomeDataManagerError>) in
                switch result {
                    case let .success(data):
                        let receips = data.hits?.compactMap { $0.recipe } ?? []
                        promise(.success(ReceipeTopExchangeResponse(data: receips)))
                    case let .failure(error):
                        promise(.failure(error))
                }
            }
        }
    }
}
