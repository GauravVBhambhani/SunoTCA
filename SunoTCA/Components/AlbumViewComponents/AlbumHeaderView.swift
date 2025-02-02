//
//  AlbumHeaderView.swift
//  SunoTCA
//
//  Created by Gaurav Bhambhani on 2/1/25.
//

import SwiftUI
import SwiftfulUI

struct AlbumHeaderView: View {

    var albumImage: String = Constants.randomImage
    var albumImageHeight: CGFloat = 300

    var albumTitle: String = "Album Title"

    var body: some View {
        Rectangle()
            .opacity(0.001)
            .overlay (
                ImageLoader(urlString: albumImage)
            )
            .overlay(
                VStack (alignment: .leading) {
                    Text(albumTitle)
                        .font(.title)
                        .fontWeight(.bold)
                }
                    .foregroundStyle(.white)
                    .padding(12)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        LinearGradient(colors: [.white.opacity(0), .white], startPoint: .top, endPoint: .bottom)
                    )

                , alignment: .bottom
            )
            .asStretchyHeader(startingHeight: albumImageHeight)
    }
}

#Preview {
    ScrollView {
        AlbumHeaderView()
    }
}
