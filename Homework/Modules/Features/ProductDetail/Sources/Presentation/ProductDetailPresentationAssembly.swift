//
//  ProductDetailPresentationAssembly.swift
//  ProductDetail
//
//  Created by 윤재욱 on 6/21/25.
//

import Swinject

public struct ProductDetailPresentationAssembly: Assembly {
    public init() {}
    
    public func assemble(container: Container) {
        container.register(ProductDetailViewControllerFactory.self) { resolver in
            ProductDetailViewControllerFactory { payload in
                let viewModel = ProductDetailViewModel(coordinator: payload.coordinator, linkURL: payload.linkURL)
                return ProductDetailViewController(viewModel: viewModel)
            }
        }
    }
}
