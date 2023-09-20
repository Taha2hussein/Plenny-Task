//
//  PlennyTests.swift
//  PlennyTests
//
//  Created by Taha Hussein on 18/09/2023.
//

import XCTest
import Combine
import SwiftUI
@testable import Plenny

final class PlennyTests: XCTestCase {
    
    var subscriptions = Set<AnyCancellable>()
     var viewModel: LoginViewModel!
    var mocking: Utility?
    private var disposal = Disposal()
    
    override func setUp() {
        super.setUp()
        viewModel = LoginViewModel()
        mocking = Utility()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    override func setUpWithError() throws {
        
    }
    
    override func tearDownWithError() throws {
        
    }
    
    func testLogin() {
        let expection = XCTestExpectation(description: "login")
        let reporsitry = viewModel.repositry
        var loginResponse: LoginModel?
        var errorResponse: Error?
        reporsitry.login(username: "kminchelle", password: "0lelplR").observe { result, _ in
            guard let result = result else { return }
            
            switch result {
            case .success(let sucess):
                loginResponse = sucess
            case .failure(let error):
                errorResponse = error
                
            }
            expection.fulfill()
        }.add(to: &disposal)
        wait(for: [expection], timeout: 3.0)
        XCTAssertNil(errorResponse)
        XCTAssertNotNil(loginResponse)
        
    }
    
    func testPosts() {
        let expection = XCTestExpectation(description: "posts downloaded")
        let reporsitry = viewModel.repositry
         var posts = [Post]()
        var errorResponse: Error?
        reporsitry.getAllPosts().observe { result, _ in
            guard let result = result else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let resonse):
                    posts = resonse.posts
                case .failure(let error):
                    errorResponse = error
                }
            }
            expection.fulfill()
        }.add(to: &disposal)
        wait(for: [expection], timeout: 5.0)
        XCTAssertNil(errorResponse)
        XCTAssertNotNil(posts)
        let postsCount = posts.count
        XCTAssertEqual(postsCount, 30, "Posts count should be more that 0")
    }
    
    func testParsingMockJSON() {
        // Load mock JSON data
        guard let jsonData = mocking?.loadMockJSONData(fileName: "posts") else {
            XCTFail("Failed to load mock JSON data")
            return
        }
        
        do {
            // Parse the JSON data
            let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
            
            // Assert the expected structure or values in the JSON
            if let jsonDict = jsonObject as? [String: Any] {
                if let posts = jsonDict["posts"]  as? [[String: Any]] {
                    XCTAssertEqual(posts.count, 30)
                    let firstObject = posts[0]
                    XCTAssertEqual(firstObject["id"] as? Int, 1)
                    XCTAssertEqual(firstObject["userId"] as? Int, 9)
                    
                    let firstObject1 = posts[1]
                    XCTAssertEqual(firstObject1["id"] as? Int, 2)
                    XCTAssertEqual(firstObject1["userId"] as? Int, 13)
                }
            } else {
                XCTFail("Invalid JSON structure")
            }
        } catch {
            XCTFail("Error parsing mock JSON: \(error)")
        }
    }
}
