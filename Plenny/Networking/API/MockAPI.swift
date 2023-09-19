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
    
}

extension MockAPI: EndPointType {
    var baseURL: URL {
        URL(string: "https://dummyjson.com/")!
    }
    
    var path: String {
        switch self {
        case .login:
            return "auth/login"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .login:
            return .post
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
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .login:
            return [:]
        }
    }
}
