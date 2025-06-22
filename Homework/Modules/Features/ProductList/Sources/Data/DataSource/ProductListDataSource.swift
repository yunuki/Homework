//
//  ProductListDataSource.swift
//  ProductList
//
//  Created by 윤재욱 on 6/21/25.
//

import Foundation

import Networking

protocol ProductListDataSource {
    func fetchProductList() async throws -> [ProductResponse]
}

struct ProductListDataSourceMockImpl: ProductListDataSource {
    func fetchProductList() async throws -> [ProductResponse] {
        
        // 0.5초 지연
        try await Task.sleep(nanoseconds: 500_000_000)
        
        // products.json 로드
        guard let url = Bundle.module.url(forResource: "products", withExtension: "json") else {
            throw NSError(domain: "MissingFile", code: 404, userInfo: nil)
        }
        
        let data = try Data(contentsOf: url)
        let products = try JSONDecoder().decode([ProductResponse].self, from: data)
        return products
    }
}
