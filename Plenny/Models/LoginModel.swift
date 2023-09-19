//
//  LoginModel.swift
//  Plenny
//
//  Created by Taha Hussein on 18/09/2023.
//

import Foundation
// MARK: - LoginModel
struct LoginModel: Decodable {
    var id: Int
    var username, email, firstName, lastName: String
    var gender: String
    var image: String
    var token: String
}
