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
    private var disposal = Disposal()
    
    override func setUp() {
        super.setUp()
        viewModel = LoginViewModel()
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
}
