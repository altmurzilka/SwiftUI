//
//  CardView.swift
//  Card_View_tutorial_AppCoda
//
//  Created by алтынпончик on 5/17/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    var image: String
    var category: String
    var heading: String
    var author: String
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            HStack {
                VStack(alignment: .leading) {
                    Text(category)
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text(heading)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                    Text(author.uppercased())
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .layoutPriority(100)
                Spacer()
            }.padding()
        }
        .cornerRadius(10)
               .overlay(
                   RoundedRectangle(cornerRadius: 10)
                      .stroke(Color(.sRGB, red: 103/255, green: 192/255, blue: 174/255, opacity: 0.8), lineWidth: 1)
               )
               .padding([.top, .horizontal])
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(image: "swiftui-button", category: "SwiftUI", heading: "Drawing a Border with Rounded Corners", author: "Simon Ng")
    }
}
