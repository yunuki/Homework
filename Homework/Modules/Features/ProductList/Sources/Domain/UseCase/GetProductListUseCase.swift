//
//  GetProductListUseCase.swift
//  ProductList
//
//  Created by 윤재욱 on 6/21/25.
//

public protocol GetProductListUseCase {
    func execute() async throws -> [Product]
}

struct GetProductListUseCaseImpl: GetProductListUseCase {
    
    let repository: ProductListRepository
    
    init(repository: ProductListRepository) {
        self.repository = repository
    }
    
    func execute() async throws -> [Product] {
        try await repository.getProductList()
    }
}
