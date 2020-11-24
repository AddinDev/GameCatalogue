//
//  ListFav.swift
//  Submission Final iOS
//
//  Created by addjn on 10/08/20.
//  Copyright © 2020 pstw._. All rights reserved.
//

import SwiftUI
import URLImage

struct ListFav: View {
    var game: FavGame
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    URLImage(URL(string: game.image!)!, delay: 0.25, placeholder: Image(systemName: "capsule")) { proxy in
                        proxy.image
                            .renderingMode(.original)
                            .resizable()
                    }
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                    .padding()
                    
                    VStack(alignment: .leading) {
                        Text(game.name!)
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text(String(game.rating))
                        }
                        
                        Text(game.released!)
                    }
                }
            }
            Spacer()
        }
    }
}
