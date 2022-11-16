//
//  HomePresenter.swift
//  YapeCuisineRecipes
//
//  Created by Rone Shender Loza Aliaga on 13/11/22.
//

import UIKit

class HomePresenter: HomeInteractorOutput {
    
    weak var viewModel: HomePresenterInput?
    
    init(viewModel: HomePresenterInput? = nil) {
        self.viewModel = viewModel
    }
    
    @MainActor func setReceips(receipts: [CuisineReceipe]) {
        self.viewModel?.setReceipes(self.formatReceips(receipts: receipts))
    }
    
    func formatReceips(receipts: [CuisineReceipe]) -> [CuisineReceipeModel] {
        return receipts.compactMap { CuisineReceipeModel(model: $0) }
    }
        
    func handleError(error: HomeDataManagerError) {}
    
}
