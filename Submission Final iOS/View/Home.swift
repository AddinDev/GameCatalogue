//
//  Home.swift
//  Submission Final iOS
//
//  Created by addjn on 10/08/20.
//  Copyright © 2020 pstw._. All rights reserved.
//

import SwiftUI

struct Home: View {
    @ObservedObject var networking = Networking()
    var body: some View {
        NavigationView {
            List(networking.games) { game in
                NavigationLink(destination: DetailView(game: game)
                ) {
                    ListGame(game: game)
                }
            }
            .navigationBarTitle("Games", displayMode: .inline)
            .navigationBarItems(trailing: NavigationLink(destination: Profile()) {
                Image(systemName: "person")
                    .padding()
            })
                .onAppear{
                    self.networking.getData()
            }
        }
    }
}
