//
//  ItemsModel.swift
//  Plenny
//
//  Created by Taha Hussein on 19/09/2023.
//

import Foundation
// MARK: - ItemsModel
struct ItemsModel: Codable {
    let posts: [Post]
    let total, skip, limit: Int
}

// MARK: - Post
struct Post: Codable, Identifiable {
    let id: Int
    let title, body: String
    let userID: Int
    let tags: [String]
    let reactions: Int

    enum CodingKeys: String, CodingKey {
        case id, title, body
        case userID = "userId"
        case tags, reactions
    }
}
