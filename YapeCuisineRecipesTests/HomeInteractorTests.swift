//
//  HomeInteractor.swift
//  YapeCuisineRecipesTests
//
//  Created by Rone Shender Loza Aliaga on 12/11/22.
//

import XCTest
@testable import YapeCuisineRecipes

class HomeInteractorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_givenKeyword_whenGetTopReceips_thenDidSetReceips() async {
        //Given
        var presenter = HomePresenterStub()
        var didSetReceips: Bool = false
        presenter.accept = { (_ params: Any...) in
            didSetReceips = true
        }
        let sut: HomeInteractorInput = HomeInteractor(
            output: presenter,
            dataManager: HomeDataManagerStub())
        //When
        await sut.getTopReceips(keyword: "pasta")
        //Then
        XCTAssertTrue(didSetReceips)
    }
    
    func test_givenKeyword_whenGetTopReceips_thenDidHandleError() async {
        //Given
        var presenter = HomePresenterStub()
        var didHandleError: Bool = false
        presenter.accept = { (_ params: Any...) in
            didHandleError = true
        }
        let sut: HomeInteractorInput = HomeInteractor(
            output: presenter,
            dataManager: HomeDataManagerStubError())
        //When
        await sut.getTopReceips(keyword: "pasta")
        //Then
        XCTAssertTrue(didHandleError)
    }

}
