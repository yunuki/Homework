//
//  ProductResponse.swift
//  ProductList
//
//  Created by 윤재욱 on 6/21/25.
//

import Foundation

struct ProductResponse: Decodable {
    let id: String
    let name: String
    let brand: String
    let price: Int
    let discountPrice: Int
    let discountRate: Int
    let image: URL
    let link: URL
    let tags: [String]
    let benefits: [String]
    let rating: Double
    let reviewCount: Int
}
