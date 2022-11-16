//
//  HomeInteractorPresenterStub.swift
//  YapeCuisineRecipesTests
//
//  Created by Rone Shender Loza Aliaga on 12/11/22.
//

import Foundation
@testable import YapeCuisineRecipes

final class HomePresenterStub: HomePresenter, Mock {
    
    var accept: ((_ params: Any...) -> ())?
    
    override func setReceips(receipts: [CuisineReceipe]) {
        super.setReceips(receipts: receipts)
        self.accept?()
    }
    
    override func handleError(error: HomeDataManagerError) {
        super.handleError(error: error)
        self.accept?()
    }
}
