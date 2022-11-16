//
//  HomeDataManagerStub.swift
//  YapeCuisineRecipesTests
//
//  Created by Rone Shender Loza Aliaga on 12/11/22.
//

import Foundation
import Combine
@testable import YapeCuisineRecipes

struct HomeDataManagerStub: HomeDataManagerExchangeable {
    
    func getTopReceips(request: DataManagerExchangeRequest) -> Future<ReceipeTopExchangeResponse, HomeDataManagerError> {
        Future { promise in
            let testBundle = Bundle(for: HomeInteractorTests.self)
            guard let fileUrl = testBundle.url(forResource: "receipe_tops", withExtension: "json"),
                  let json = try? Data(contentsOf: fileUrl),
                  let data = try? JSONDecoder().decode(SearchResponse.self, from: json) else {
                      promise(.failure(HomeDataManagerError.decodeTypeFailure))
                      return
                  }
            let receips = data.hits?.compactMap { $0.recipe } ?? []
            promise(.success(ReceipeTopExchangeResponse(data: receips)))
        }
    }
}

struct HomeDataManagerStubError: HomeDataManagerExchangeable {
    
    func getTopReceips(request: DataManagerExchangeRequest) -> Future<ReceipeTopExchangeResponse, HomeDataManagerError> {
        Future { promise in
            promise(.failure(.decodeTypeFailure))
        }
    }
}
