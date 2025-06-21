//
//  ProductListRepository.swift
//  ProductList
//
//  Created by 윤재욱 on 6/21/25.
//

public protocol ProductListRepository {
    func getProductList() async throws -> [Product]
}
