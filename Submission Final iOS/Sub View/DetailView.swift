//
//  DetailView.swift
//  Submission Final iOS
//
//  Created by addjn on 10/08/20.
//  Copyright © 2020 pstw._. All rights reserved.
//

import SwiftUI
import URLImage

struct DetailView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: FavGame.entity(), sortDescriptors: []) var favGame: FetchedResults<FavGame>
    @ObservedObject var networking = Networking()
    
    var game: Game
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 0) {
                URLImage(URL(string: game.image)!, placeholder: Image(systemName: "capsule")) { proxy in
                    proxy.image
                        .resizable()
                }
                .frame(height: 250)
                .aspectRatio(contentMode: .fit)
                
                HStack {
                    VStack(alignment: .center ,spacing: 0) {
                        Text("Release Date")
                            .font(.footnote)
                            .fontWeight(.medium)
                        Text(game.released)
                            .font(.footnote)
                        
                    }
                    .padding()
                    
                    Spacer()
                    HStack(spacing: 0) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .offset(x: -5)
                        Text(String(game.rating))
                            .font(.footnote)
                    }
                    .padding()
                }
                
                Text("Description")
                    .font(.headline)
                    .fontWeight(.medium)
                    .padding(.bottom, 10)
                
                Text(formatText(word: self.networking.desc))
                    .padding(.horizontal, 20)
                
            }
            .navigationBarTitle("\(game.name)", displayMode: .inline)
            .navigationBarItems(trailing:
                Button("Fav") {
                    
                    let favGame = FavGame(context: self.moc)
                    favGame.id = UUID()
                    favGame.gameId = String(self.game.id)
                    favGame.name = self.game.name
                    favGame.gamePath = self.game.gamePath
                    favGame.released = self.game.released
                    favGame.image = self.game.image
                    favGame.rating = self.game.rating
                    
                    try? self.moc.save()
                }
            )
        }
        .onAppear {
            self.networking.getDetail(gameId: self.game.id)
        }
    }
    
    func formatText(word: String) -> String {
        let a = word.replacingOccurrences(of: "<[^>]+>", with: "", options: String.CompareOptions.regularExpression, range: nil)
        let result = a.replacingOccurrences(of: "&[^;]+;", with: "", options: String.CompareOptions.regularExpression, range: nil)
        return result
    }
    
}

