//
//  ProductListPresentationAssembly.swift
//  ProductList
//
//  Created by 윤재욱 on 6/21/25.
//

import ProductListDomain

import Swinject

public struct ProductListPresentationAssembly: Assembly {
    public init() {}
    
    public func assemble(container: Container) {
        container.register(ProductListViewControllerFactory.self) { resolver in
            ProductListViewControllerFactory { payload in
                guard let getProductListUseCase = resolver.resolve(GetProductListUseCase.self) else {
                    fatalError("Required dependencies could not be resolved.")
                }
                let viewModel = ProductListViewModel(getProductListUseCase: getProductListUseCase, coordinator: payload)
                return ProductListHostingController(rootView: ProductListView(viewModel: viewModel))
            }
        }
    }
}
