//
//  Favourite.swift
//  Submission Final iOS
//
//  Created by addjn on 10/08/20.
//  Copyright © 2020 pstw._. All rights reserved.
//

import SwiftUI

struct Favourite: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: FavGame.entity(), sortDescriptors: []) var favGame: FetchedResults<FavGame>
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(favGame, id: \.id) { game in
                        NavigationLink(destination: DetailFav(game: game)) {
                            ListFav(game: game)
                        }
                    }
                    .onDelete(perform: delete)
                }
                .navigationBarTitle("Favourite", displayMode: .inline)
                .navigationBarItems(leading: EditButton())
            }
            .onAppear {
                try? self.moc.save()
            }
        }
    }
    func delete(at offsets: IndexSet) {
        for offset in offsets {
            let game = favGame[offset]
            moc.delete(game)
        }
        try? moc.save()
    }
}
