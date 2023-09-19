//
//  Repository.swift
//  Plenny
//
//  Created by Taha Hussein on 18/09/2023.
//


import Foundation

protocol RepositoryProtocol {
    func login(username: String, password: String) -> NetworkResult<LoginModel>
}

final class Repository: RepositoryProtocol {
    
    private let router = Router<MockAPI>()

    func login(username: String, password: String) -> NetworkResult<LoginModel> {
        router.request(.login(username: username, password: password)).asObservable()
    }
}
