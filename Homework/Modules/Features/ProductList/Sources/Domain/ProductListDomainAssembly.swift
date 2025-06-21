//
//  ProductListDomainAssembly.swift
//  ProductList
//
//  Created by 윤재욱 on 6/21/25.
//

import Swinject

public struct ProductListDomainAssembly: Assembly {
    public init() {}
    
    public func assemble(container: Container) {
        container.register(GetProductListUseCase.self) { resolver in
            guard let repository = resolver.resolve(ProductListRepository.self) else {
                fatalError("Required dependencies could not be resolved.")
            }
            return GetProductListUseCaseImpl(repository: repository)
        }
    }
}
