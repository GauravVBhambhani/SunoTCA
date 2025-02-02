//
//  AlbumRowComponent.swift
//  SunoTCA
//
//  Created by Gaurav Bhambhani on 2/1/25.
//

import SwiftUI

struct AlbumButtonView: View {

    var albumImage: String = Constants.randomImage
    var albumTitle: String = "Album title Album title Album title Album title Album title"
    var albumSubtitle: String = "Album Subtitle"

    var albumPressed: (()->())? = nil

    var body: some View {
        VStack (alignment: .leading) {
            ImageLoader(urlString: albumImage)
                .frame(width: 200, height: 200)
                .cornerRadius(5)

            Text(albumTitle)
                .font(.title3)
                .fontWeight(.semibold)
                .lineLimit(2)

            Text(albumSubtitle)
                .font(.subheadline)
                .lineLimit(2)
        }
        .frame(width: 200)
        .onTapGesture {
            albumPressed?()
        }
    }
}

#Preview {
    ScrollView (.horizontal){
        HStack {
            AlbumButtonView()
            AlbumButtonView()
            AlbumButtonView()
        }
    }

}
