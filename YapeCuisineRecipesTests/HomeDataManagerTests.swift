//
//  HomeDataManager.swift
//  YapeCuisineRecipesTests
//
//  Created by Rone Shender Loza Aliaga on 12/11/22.
//

import XCTest
import OHHTTPStubsSwift
import OHHTTPStubs
import Combine
@testable import YapeCuisineRecipes

class HomeDataManagerTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_givenSearch_whenGetTopReceips_thenHasResults() async {
        //Given
        let sut: HomeDataManagerExchangeable = HomeDataManager(dataManager: NetworkDataManager())
        let request = NetworkDataManagerExchangeRequest(
            host: NetworkDataManagerConstant.host,
            path: NetworkDataManagerConstant.search,
            query: [NetworkDataManagerConstant.appIdKey :
                        NetworkDataManagerConstant.appIdValue,
                    NetworkDataManagerConstant.appKey :
                        NetworkDataManagerConstant.appKeyValue,
                    NetworkDataManagerConstant.q : "onion"],
            headers: NetworkDataManagerConstant.contentType)
        stub(condition: (isHost(request.host) &&
                         isPath(request.path))) { _ in
            let path = OHPathForFile("receipe_tops.json", HomeDataManagerTests.self)
            return HTTPStubsResponse(fileAtPath: path!,
                                     statusCode: 200,
                                     headers: request.headers)
        }
        //When
        let response = try? await sut.getTopReceips(request: request).value
        //Then
        XCTAssertTrue((response?.data.count ?? 0) > 0)
    }
    
    func test_givenSearch_whenGetTopReceips_thenReturnUrlMalFormedError() async {
        //Given
        let sut: HomeDataManagerExchangeable = HomeDataManager(dataManager: NetworkDataManager())
        let request = NetworkDataManagerExchangeRequest(
            host: "",
            path: "")
        //When
        do {
            _ = try await sut.getTopReceips(request: request).value
        } catch {
            XCTAssertTrue((error as? HomeDataManagerError) == .urlMalFormed)
        }
    }
    
    func test_givenSearch_whenGetTopReceips_thenReturnDecodeTypeFailureError() async {
        //Given
        let sut: HomeDataManagerExchangeable = HomeDataManager(dataManager: NetworkDataManager())
        let request = NetworkDataManagerExchangeRequest(
            host: NetworkDataManagerConstant.host,
            path: NetworkDataManagerConstant.search,
            query: [NetworkDataManagerConstant.appIdKey :
                        NetworkDataManagerConstant.appIdValue,
                    NetworkDataManagerConstant.appKey :
                        NetworkDataManagerConstant.appKeyValue,
                    NetworkDataManagerConstant.q : "onion"],
            headers: NetworkDataManagerConstant.contentType)
        stub(condition: (isHost(request.host) &&
                         isPath(request.path))) { _ in
            let path = OHPathForFile("receipe_tops_empty.json", HomeDataManagerTests.self)
            return HTTPStubsResponse(fileAtPath: path!,
                                     statusCode: 200,
                                     headers: request.headers)
        }
        //When
        do {
            _ = try await sut.getTopReceips(request: request).value
        } catch {
            XCTAssertTrue((error as? HomeDataManagerError) == .decodeTypeFailure)
        }
    }
    
}
