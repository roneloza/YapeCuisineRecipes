//
//  HomeViewModel.swift
//  YapeCuisineRecipes
//
//  Created by Rone Shender Loza Aliaga on 13/11/22.
//

import Foundation

protocol HomePresenterInput: AnyObject {
    
    var receipes: [CuisineReceipeModel] { get }
    var interactor: HomeInteractorInput? { get set }
    
    func searchResults(searchText: String) async
    @MainActor func setReceipes(_ receipts: [CuisineReceipeModel])
}

class HomeViewModel: ObservableObject, HomePresenterInput {
    
    @Published var searchText = ""
    @Published var categoryTag = 0
    @Published private(set) var  receipes: [CuisineReceipeModel] = []
    var category = [
        "Chicken",
        "Pizza",
        "Fish",
        "Vegan"
    ]
    
    var interactor: HomeInteractorInput?
    
    func searchResults(searchText: String = "") async {
        if searchText.isEmpty {
            await self.interactor?.getTopReceips(keyword: self.category[self.categoryTag])
        } else {
            await self.interactor?.getTopReceips(keyword: searchText)
        }
    }
    
    @MainActor
    func setReceipes(_ receipts: [CuisineReceipeModel]) {
        self.receipes = receipts
    }
}
