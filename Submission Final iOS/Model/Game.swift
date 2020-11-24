//
//  Game.swift
//  Submission Final iOS
//
//  Created by addjn on 10/08/20.
//  Copyright © 2020 pstw._. All rights reserved.
//

import Foundation

struct Games: Codable {
    
    let games: [Game]
    
    enum CodingKeys: String, CodingKey {
        case games = "results"
        
    }
}

struct Game: Hashable, Codable, Identifiable {
    let gameId = UUID()
    let id: Int
    let gamePath: String
    let name: String
    let released: String
    let image: String
    let rating: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case gamePath
        case name
        case released
        case image = "background_image"
        case rating
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        
        let id = try container.decode(Int.self, forKey: .id)
        gamePath = "https://api.rawg.io/api/games/\(id)"
        
        name = try container.decode(String.self, forKey: .name)
        
        released = try container.decode(String.self, forKey: .released)
        
        image = try container.decode(String.self, forKey: .image)
        
        rating = try container.decode(Double.self, forKey: .rating)
        
    }
}

struct GameDetail: Codable {
    var description: String
    
}

//struct GamesSearch: Codable {
//    let results: [Result]
//
//    enum CodingKeys: String, CodingKey {
//        case results
//    }
//}
//
//struct Result: Identifiable, Codable {
//    var id = UUID()
//    var gameId: Int
//    let name: String
//    let released: String
//    let rating: Double
//    let background_image: String
//
//    enum CodingKeys: String, CodingKey {
//        case gameId = "id"
//        case name
//        case released
//        case rating
//        case background_image
//    }
//}

// MARK: - PurpleData
struct PurpleData: Codable {
    
    let results: [Result]?
    
    enum CodingKeys: String, CodingKey {
        case results
        
    }
}

// MARK: - Result
struct Result: Codable, Identifiable {
    var id = UUID()
    let name: String?
    let released: String?
    let backgroundImage: String?
    let rating: Double?
    let gameId: Int?
    
    enum CodingKeys: String, CodingKey {
        case name
        case released
        case backgroundImage = "background_image"
        case rating
        case gameId = "id"
        
    }
}
