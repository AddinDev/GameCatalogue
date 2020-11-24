//
//  ContentView.swift
//  Submission Final iOS
//
//  Created by addjn on 10/08/20.
//  Copyright © 2020 pstw._. All rights reserved.
//
import SwiftUI

struct ContentView: View {
    @State var selected = 0
    var body: some View {
        TabView(selection: $selected) {
            Home().tabItem {
                VStack {
                    Image(systemName: "house")
                    Text("Home")
                }
            }.tag(0)
            Favourite().tabItem {
                VStack {
                    Image(systemName: "heart.fill")
                    Text("Favourite")
                }
            }.tag(1)
            Search().tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search")
            }.tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
