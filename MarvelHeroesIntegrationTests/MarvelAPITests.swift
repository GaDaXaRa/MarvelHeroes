//
//  MarvelAPITests.swift
//  MarvelHeroesIntegrationTests
//
//  Created by Miguel Santiago on 09/04/2021.
//

import XCTest
@testable import MarvelHeroes

class MarvelAPITests: XCTestCase {
    
    let apiRouter = AFApiRouter()

    func testShouldObtainHeroesList() {
        let expectation = XCTestExpectation()
        apiRouter.request(apiCall: MarvelAPI.heroList) { (result: Result<MarvelResponseContainer, Error>) in
            switch result {
            case .success(let results):
                print(results)
            case .failure(_):
                XCTFail()
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 20)
    }

}
