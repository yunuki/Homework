//
//  ProductListDataAssembly.swift
//  ProductList
//
//  Created by 윤재욱 on 6/21/25.
//

import ProductListDomain

import Swinject

public struct ProductListDataAssembly: Assembly {
    public init() {}
    
    public func assemble(container: Container) {
        container.register(ProductListDataSource.self) { resolver in
            ProductListDataSourceMockImpl()
        }
        
        container.register(ProductListRepository.self) { resolver in
            guard let dataSource = resolver.resolve(ProductListDataSource.self) else {
                fatalError("Required dependencies could not be resolved.")
            }
            return ProductListRepositoryImpl(dataSource: dataSource)
        }
    }
}
