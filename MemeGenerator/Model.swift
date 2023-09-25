//
//  Model.swift
//  MemeGenerator
//
//  Created by Aizada on 21.09.2023.
//

import Foundation

struct MemeRequest: Encodable {
    let meme: String
    let top: String
    let bottom: String
}

struct MemeResponse: Codable {
    let url: String
}
