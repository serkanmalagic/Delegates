//
//  Comment.swift
//  Delegates
//
//  Created by Serkan Mehmet Malagiç on 24.10.2021.
//

import Foundation

struct Comment: Codable {
    let postID, id: Int
    let name, email, body: String
    
    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}
