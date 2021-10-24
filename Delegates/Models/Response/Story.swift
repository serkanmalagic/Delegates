//
//  Story.swift
//  Delegates
//
//  Created by Serkan Mehmet Malagiç on 24.10.2021.
//

import Foundation

struct MovieResponse: Codable {
    let userID, id: Int
    let title, body: String
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
