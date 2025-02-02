//
//  TracksListView.swift
//  SunoTCA
//
//  Created by Gaurav Bhambhani on 2/1/25.
//

import SwiftUI
import SwiftfulUI

struct TracksListView: View {
    
    var trackImage: String = Constants.randomImage

    var trackTitle: String = "Album Title"
    var trackCategory: [String] = ["Country", "Pop"]
    var trackArtist: String = "Artist"

    var trackListens: Int = 791
    var trackLikes: Int = 123

    var trackPressed: (()->())? = nil

    var body: some View {
        HStack {
            HStack(alignment: .center) {
                ImageLoader(urlString: trackImage)
                    .frame(width: 60, height: 70)
                    .cornerRadius(5)

                VStack (alignment: .leading) {
                    Text(trackTitle)
                        .font(.headline)

                    HStack (spacing: 5) {
                        ForEach(trackCategory, id: \.self) { category in
                            Text("\(category),")
                        }
                        Text("+21")
                    }
                    .foregroundStyle(.gray)

                    HStack (spacing: 10){

                        HStack (spacing: 5) {
                            Image(systemName: "play.fill")
                                .font(.subheadline)

                            Text("\(trackListens)")
                        }

                        HStack (spacing: 5) {
                            Image(systemName: "hand.thumbsup.fill")
                                .font(.subheadline)

                            Text("\(trackLikes)")
                        }

                        HStack (spacing: 5) {
                            Image(systemName: "person.fill")
                                .font(.subheadline)

                            Text("\(trackArtist)")
                        }
                    }
                    .foregroundStyle(.gray)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Image(systemName: "ellipsis")
        }
        .padding(.horizontal, 12)
        .onTapGesture {
            trackPressed?()
        }
    }
}

#Preview {
    VStack {
        TracksListView()
        TracksListView()
        TracksListView()
        TracksListView()
    }

}
