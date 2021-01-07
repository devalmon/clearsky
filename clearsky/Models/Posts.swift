//
//  Posts.swift
//  clearsky
//
//  Created by Alexey Baryshnikov on 04.01.2021.
//

import Foundation

struct Posts: Codable {
    let userId: Int
    let postId: Int
    let title: String
    let body: String
    
    enum CodingKeys: String, CodingKey {
        case userId
        case postId = "id"
        case title
        case body
    }
    
}
