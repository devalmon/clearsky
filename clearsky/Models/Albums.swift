//
//  Albums.swift
//  clearsky
//
//  Created by Alexey Baryshnikov on 02.01.2021.
//

import Foundation

struct Albums: Codable {
    let userId: Int
    let albumId: Int
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case userId
        case albumId = "id"
        case title
    }
}
