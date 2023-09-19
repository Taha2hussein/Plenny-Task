//
//  MockAPI.swift
//  NetworkLayer
//
//  Created by Nurtugan Nuraly on 6/29/20.
//  Copyright © 2020 Malcolm Kumwenda. All rights reserved.
//

import Foundation

enum MockAPI {
    
    case login(username: String, password: String)
    case allPosts
}

extension MockAPI: EndPointType {
    var baseURL: URL {
        URL(string: "https://dummyjson.com/")!
    }
    
    var path: String {
        switch self {
        case .login:
            return "auth/login"
        case .allPosts:
            return "posts"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .allPosts:
            return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .login(let username, let password):
            return .requestParameters(bodyParameters:
                                        ["username": username,
                                        "password":password],
                                      bodyEncoding: .jsonEncoding,
                                      urlParameters: nil)
            
        case .allPosts:
            return.requestParameters(bodyParameters: nil,
                                      bodyEncoding: .jsonEncoding,
                                      urlParameters: nil)
            
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .login,.allPosts:
            return [:]
        }
    }
}
