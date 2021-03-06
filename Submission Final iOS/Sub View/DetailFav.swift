//
//  DetailFav.swift
//  Submission Final iOS
//
//  Created by addjn on 10/08/20.
//  Copyright © 2020 pstw._. All rights reserved.
//

import SwiftUI
import URLImage

struct DetailFav: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: FavGame.entity(), sortDescriptors: []) var favGame: FetchedResults<FavGame>
    @ObservedObject var networking = Networking()
    
    var game: FavGame
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 0) {
                URLImage(URL(string: game.image ?? "")!, placeholder: Image(systemName: "capsule")) { proxy in
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
                        Text(game.released ?? "")
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
            .navigationBarTitle("\(game.name ?? "")", displayMode: .inline)
            .navigationBarItems(trailing:
                Button("Remove") {
                    self.moc.delete(self.game)
                    try? self.moc.save()
            })
        }
        .onAppear {
            self.networking.getDetail(gameId: Int(self.game.gameId!)!)
        }
    }
    func formatText(word: String) -> String {
         let a = word.replacingOccurrences(of: "<[^>]+>", with: "", options: String.CompareOptions.regularExpression, range: nil)
         let result = a.replacingOccurrences(of: "&[^;]+;", with: "", options: String.CompareOptions.regularExpression, range: nil)
         return result
     }
}

