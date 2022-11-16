//
//  HomePresenter.swift
//  YapeCuisineRecipesTests
//
//  Created by Rone Shender Loza Aliaga on 12/11/22.
//

import XCTest
@testable import YapeCuisineRecipes

class HomePresenterTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_given_whenGetTopReceips_thenDidSetReceips() async {
        //Given
        let viewModel = HomeViewModelStub()
        let sut = HomePresenterStub(viewModel: viewModel)
        //When
        await sut.setReceips(receipts: [CuisineReceipe(
            label: "Chicken Vesuvio",
            ingredients: [
                CuisineIngredient(text: "1/2 cup olive oil",
                                  food: "olive oil",
                                  image: "https://www.edamam.com/food-img/4d6/4d651eaa8a353647746290c7a9b29d84.jpg")],
            image: "https://www.edamam.com/food-img/4d6/4d651eaa8a353647746290c7a9b29d84.jpg")])
        //Then
        XCTAssertTrue(viewModel.receipes.count > 0)
    }
}

struct HomeInteractorStub: HomeInteractorInput, Mock {
    
    var output: HomeInteractorOutput
    var accept: ((_ params: Any...) -> ())?
    
    func getTopReceips(keyword: String) async {
        self.accept?(keyword)
    }
}

class HomeViewModelTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_givenSearchTextIsEmpty_whenSearchResults_thenCalledReceipesCategory() async {
        //Given
        let sut = HomeViewModelStub()
        var didCalledCategory: Bool = false
        var interactor = HomeInteractorStub(output: HomePresenterStub(viewModel: sut))
        interactor.accept = { (_ params: Any...) in
            didCalledCategory = sut.category.contains { $0 == ((params[0] as? String) ?? "") }
        }
        sut.interactor = interactor
        //When
        await sut.searchResults(searchText: "")
        //Then
        XCTAssertTrue(didCalledCategory)
    }
    
    func test_givenSearchText_whenSearchResults_thenCalledReceipesSearch() async {
        //Given
        let sut: HomePresenterInput = HomeViewModelStub()
        var didCalledSearch: Bool = false
        var interactor = HomeInteractorStub(output: HomePresenterStub(viewModel: sut))
        interactor.accept = { (_ params: Any...) in
            didCalledSearch = "Onion" == ((params[0] as? String) ?? "")
        }
        sut.interactor = interactor
        //When
        await sut.searchResults(searchText: "Onion")
        //Then
        XCTAssertTrue(didCalledSearch)
    }
    
}
