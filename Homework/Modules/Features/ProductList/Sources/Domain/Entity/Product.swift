//
//  Product.swift
//  ProductList
//
//  Created by 윤재욱 on 6/21/25.
//

import Entity

public struct Product {
    public let base: BaseProduct
    public let tags: [String]
    public let benefits: [String]
    public let rating: Double
    public let reviewCount: Int
    
    public init(base: BaseProduct, tags: [String], benefits: [String], rating: Double, reviewCount: Int) {
        self.base = base
        self.tags = tags
        self.benefits = benefits
        self.rating = rating
        self.reviewCount = reviewCount
    }
}
