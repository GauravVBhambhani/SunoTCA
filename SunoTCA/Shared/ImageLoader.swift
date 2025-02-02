//
//  ImageLoader.swift
//  SunoTCA
//
//  Created by Gaurav Bhambhani on 2/1/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageLoader: View {

    var urlString: String = Constants.randomImage

    var body: some View {
        Rectangle()
            .fill(.gray)
            .opacity(0.5)
            .overlay(
                WebImage(url: URL(string: urlString))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: .fill)
                    .allowsHitTesting(false)
            )
            .clipped()
    }
}

#Preview {
    ImageLoader()
        .cornerRadius(30)
        .padding(40)
        .padding(.vertical, 60)
}
