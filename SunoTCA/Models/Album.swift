//
//  Product.swift
//  SunoTCA
//
//  Created by Gaurav Bhambhani on 2/1/25.
//

import Foundation

/*

 URL: https://dummyjson.com/products

 "products": [
 {
 "id": 1,
 "title": "Essence Mascara Lash Princess",
 "description": "The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects. Achieve dramatic lashes with this long-lasting and cruelty-free formula.",
 "category": "beauty",
 "rating": 4.94,
 "tags": [
 "beauty",
 "mascara"
 ],
 "brand": "Essence",
 "images": [
 "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/1.png"
 ],
 "thumbnail": "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png"
 },{

 }
 ]

 */

struct AlbumArray: Codable {
    let albums: [Album]

    enum CodingKeys: String, CodingKey {
        case albums = "products"
    }
}

struct Album: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String
    let category: String
    let rating: Float
    let tags: [String]
    let albumCover: [String] // images
    let artist: String? // brand

    var firstImage: String {
        albumCover.first ?? Constants.randomImage
    }

    enum CodingKeys: String, CodingKey {
        case id, title, description, category, rating, tags
        case albumCover = "images"
        case artist = "brand"
    }
    
    // Mock data
}
