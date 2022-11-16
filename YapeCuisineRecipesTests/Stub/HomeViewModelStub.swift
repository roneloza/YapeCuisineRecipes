//
//  HomeViewModelStub.swift
//  YapeCuisineRecipesTests
//
//  Created by Rone Shender Loza Aliaga on 13/11/22.
//

@testable import YapeCuisineRecipes

final class HomeViewModelStub: HomeViewModel, Mock {
    
    var accept: ((_ params: Any...) -> ())?
    
    override func searchResults(searchText: String = "") async {
        await super.searchResults(searchText: searchText)
        self.accept?(searchText)
    }
}
