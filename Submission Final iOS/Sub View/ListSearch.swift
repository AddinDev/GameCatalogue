//
//  ListSearch.swift
//  Submission Final iOS
//
//  Created by addjn on 10/08/20.
//  Copyright © 2020 pstw._. All rights reserved.
//

import SwiftUI
import URLImage

struct ListSearch: View {
    var game: Result
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    URLImage(URL(string: game.backgroundImage ?? "https://www.google.com/imgres?imgurl=https%3A%2F%2Fsafetyaustraliagroup.com.au%2Fwp-content%2Fuploads%2F2019%2F05%2Fimage-not-found.png&imgrefurl=https%3A%2F%2Fsafetyaustraliagroup.com.au%2Fimage-not-found%2F&tbnid=X6ukzMYzOj0GaM&vet=12ahUKEwjy3PaTvo7sAhW-NrcAHWYyAloQMygIegUIARCwAQ..i&docid=R-3sT7WRr1OwYM&w=225&h=225&q=image%20not%20found&safe=strict&client=opera-gx&ved=2ahUKEwjy3PaTvo7sAhW-NrcAHWYyAloQMygIegUIARCwAQ")!, delay: 0.25, placeholder: Image(systemName: "capsule")) { proxy in
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
                            Text(String(game.rating!))
                        }
                        
                        Text(game.released ?? "")
                    }
                }
            }
            
        }
    }
}
