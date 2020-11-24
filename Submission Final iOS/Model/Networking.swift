//
//  Networking.swift
//  Submission Final iOS
//
//  Created by addjn on 10/08/20.
//  Copyright © 2020 pstw._. All rights reserved.
//

import Foundation
import Alamofire

class Networking: ObservableObject {
    @Published var games = [Game]()
    @Published var desc = String()
    @Published var searchedGame = [Result]()
    
    func getData() {
        AF.request("https://api.rawg.io/api/games")
            .validate()
            .responseDecodable(of: Games.self) { (response) in
                guard let dataGame = response.value else { return }
                self.games = dataGame.games
        }
    }
    
    func getDetail(gameId: Int) {
        AF.request("https://api.rawg.io/api/games/\(String(gameId))")
            .validate()
            .responseDecodable(of: GameDetail.self) { (response) in
                guard let gameDetail = response.value else { return }
                self.desc = gameDetail.description
        }
    }
    
    func getData(word: String) {
        AF.request("https://api.rawg.io/api/games?search=\(word)")
            .validate()
            .responseDecodable(of: PurpleData.self) { (response) in
                guard let data = response.value else { return }
                self.searchedGame = data.results!
        }
    }
    
}
