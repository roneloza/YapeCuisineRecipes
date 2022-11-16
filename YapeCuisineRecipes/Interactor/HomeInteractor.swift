//
//  HomeInteractor.swift
//  YapeCuisineRecipes
//
//  Created by Rone Shender Loza Aliaga on 12/11/22.
//

import Foundation

protocol HomeInteractorInput {
    
    var output: HomeInteractorOutput { get }
    
    func getTopReceips(keyword: String) async
}

protocol HomeInteractorOutput {
    
    func formatReceips(receipts: [CuisineReceipe]) -> [CuisineReceipeModel]
    @MainActor func setReceips(receipts: [CuisineReceipe])
    func handleError(error: HomeDataManagerError)
}

struct HomeInteractor: HomeInteractorInput {
    
    let output: HomeInteractorOutput
    let dataManager: HomeDataManagerExchangeable
    
    func getTopReceips(keyword: String) async {
        let request = NetworkDataManagerExchangeRequest(
            host: NetworkDataManagerConstant.host,
            path: NetworkDataManagerConstant.search,
            query: [NetworkDataManagerConstant.appIdKey :
                        NetworkDataManagerConstant.appIdValue,
                    NetworkDataManagerConstant.appKey :
                        NetworkDataManagerConstant.appKeyValue,
                    NetworkDataManagerConstant.q : keyword],
            headers: NetworkDataManagerConstant.contentType)
        do {
            let receipes = try await self.dataManager.getTopReceips(request: request).value
            await self.output.setReceips(receipts: receipes.data)
        } catch let error as HomeDataManagerError {
            self.output.handleError(error: error)
        } catch { }
    }
}
