//
//  Search.swift
//  Submission Final iOS
//
//  Created by addjn on 10/08/20.
//  Copyright © 2020 pstw._. All rights reserved.
//

import SwiftUI

struct Search: View {
    
    @ObservedObject var networking = Networking()
    @State var word = ""
    @State private var isPresented = false
    @State private var isSearch = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Search...", text: $word, onCommit: {
                        self.networking.getData(word: self.word)
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        self.isSearch = true
                    })
                        .padding(7)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                    Button("Search") {
                        self.networking.getData(word: self.word)
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        self.isSearch = true
                    }
                }
                .padding()
                
                if !isSearch {
                    Spacer()
                    Text("You haven't search anything.")
                        .fontWeight(.bold)
                    Image("MessyDoodle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(30)
                    Text("That's why im here.")
                        .fontWeight(.bold)
                    Spacer()
                } else {
                    List(networking.searchedGame) { game in
                        NavigationLink(destination: DetailSearch(game: game)
                        ) {
                            ListSearch(game: game)
                        }
                    }
                }
            }
            .navigationBarTitle("Search", displayMode: .inline)
            .alert(isPresented: $isPresented) {
                Alert(title: Text("fr?"), message: Text("There's no text."), dismissButton: .default(Text("Got it!")))
                
            }
        }
    }
}
