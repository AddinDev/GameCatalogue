//
//  Profile.swift
//  Submission Final iOS
//
//  Created by addjn on 10/08/20.
//  Copyright © 2020 pstw._. All rights reserved.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        
        VStack {
            Image("addin")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250, height: 250, alignment: .center)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 5))
            Text("Addin Satria Panambang")
                .fontWeight(.bold)
                .font(.system(size: 40))
                .foregroundColor(.purple)
                .lineLimit(3)
            
            Text("iOS Developer")
                .font(.system(size: 20))
            Divider()
            InfoView(text: "addinsatria2004@gmail.com", imageName: "envelope.fill", color: .red)
        }
    }
    
}

struct InfoView: View {
    let text:String
    let imageName:String
    let color: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(height: 50)
            .overlay(HStack {
                Image(systemName: imageName).foregroundColor(color)
                Text(text).foregroundColor(.purple)
            })
            .padding()
    }
    
}
