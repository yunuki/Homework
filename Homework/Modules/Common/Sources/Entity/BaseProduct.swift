//
//  BaseProduct.swift
//  Common
//
//  Created by 윤재욱 on 6/21/25.
//

import Foundation

public struct BaseProduct: Equatable {
    public let id: String
    public let name: String
    public let brand: String
    public let price: Int
    public let discountPrice: Int
    public let discountRate: Int
    public let imageURL: URL
    public let linkURL: URL
    
    public init(id: String, name: String, brand: String, price: Int, discountPrice: Int, discountRate: Int, imageURL: URL, linkURL: URL) {
        self.id = id
        self.name = name
        self.brand = brand
        self.price = price
        self.discountPrice = discountPrice
        self.discountRate = discountRate
        self.imageURL = imageURL
        self.linkURL = linkURL
    }
}
