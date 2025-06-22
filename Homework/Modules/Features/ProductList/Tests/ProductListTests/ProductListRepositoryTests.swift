//
//  ProductListRepositoryTests.swift
//  ProductList
//
//  Created by 윤재욱 on 6/21/25.
//

import XCTest
@testable import ProductListData

final class ProductListRepositoryTests: XCTestCase {

    func test_getProductList_returnsExpectedProducts() async throws {
        // Given
        let mockDataSource = ProductListDataSourceMockImpl()
        let repository = ProductListRepositoryImpl(dataSource: mockDataSource)

        // When
        let products = try await repository.getProductList()

        // Then
        XCTAssertFalse(products.isEmpty, "Should return at least one product")

        let first = products[0]
        XCTAssertEqual(first.base.id, "2059389276")
        XCTAssertEqual(first.base.name, "더엣지 25SS 썸머 찰랑 텐션데님 2종")
        XCTAssertEqual(first.rating, 4.7, accuracy: 0.01)
    }
}
