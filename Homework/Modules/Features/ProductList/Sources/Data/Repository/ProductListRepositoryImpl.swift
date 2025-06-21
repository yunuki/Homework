//
//  ProductListRepositoryImpl.swift
//  ProductList
//
//  Created by 윤재욱 on 6/21/25.
//

import ProductListDomain

import Entity

struct ProductListRepositoryImpl: ProductListRepository {
    
    let dataSource: ProductListDataSource
    
    init(dataSource: ProductListDataSource) {
        self.dataSource = dataSource
    }
    
    func getProductList() async throws -> [Product] {
        try await dataSource.fetchProductList().map { productResponse in
            let base = BaseProduct(id: productResponse.id,
                                   name: productResponse.name,
                                   brand: productResponse.brand,
                                   price: productResponse.price,
                                   discountPrice: productResponse.discountPrice,
                                   discountRate: productResponse.discountRate,
                                   imageURL: productResponse.image,
                                   linkURL: productResponse.link)
            return Product(base: base,
                           tags: productResponse.tags,
                           benefits: productResponse.benefits,
                           rating: productResponse.rating,
                           reviewCount: productResponse.reviewCount)
        }
    }
}
