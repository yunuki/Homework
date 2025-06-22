//
//  ProductListViewModel.swift
//  ProductList
//
//  Created by 윤재욱 on 6/21/25.
//

import Foundation

import Entity
import ProductListDomain

final class ProductListViewModel: ObservableObject {
    
    enum Action {
        case onAppear
        case onCompletedTask(products: [Product], error: Error?)
        case onTapItem(product: Product)
    }
    
    struct State {
        var initialized: Bool = false
        var products: [Product] = Product.dummy(count: 6)
        var error: Error?
    }
    
    @Published private(set) var state = State()
    
    private let getProductListUseCase: GetProductListUseCase
    private let coordinator: ProductListCoordinating
    
    init(getProductListUseCase: GetProductListUseCase, coordinator: ProductListCoordinating) {
        self.getProductListUseCase = getProductListUseCase
        self.coordinator = coordinator
    }
    
    func sendAction(_ action: Action) {
        Task { await reduce(action, state: state) }
    }
    
    @MainActor
    private func reduce(_ action: Action, state: State) {
        var newState = state
        switch action {
        case .onAppear:
            guard !state.initialized else { return }
            Task {
                do {
                    let products = try await getProductListUseCase.execute()
                    sendAction(.onCompletedTask(products: products, error: nil))
                } catch {
                    sendAction(.onCompletedTask(products: [], error: error))
                }
            }
            
        case .onCompletedTask(let products, let error):
            newState.initialized = true
            newState.products = products
            newState.error = error
            
        case .onTapItem(let product):
            coordinator.showProductDetail(linkURL: product.base.linkURL)
        }
        self.state = newState
    }
}

private extension Product {
    static func dummy(count: Int) -> [Self] {
        return (0..<count).map { index in
            let base = BaseProduct(id: "\(index)",
                                   name: String(repeating: "name", count: 5),
                                   brand: "brand",
                                   price: 10000,
                                   discountPrice: 10000,
                                   discountRate: 0,
                                   imageURL: URL(string: "https://example.com/image\(index).jpg")!,
                                   linkURL: URL(string: "https://example.com/product\(index)")!)
            
            return Product(base: base,
                           tags: [],
                           benefits: ["benefit1", "benefit2"],
                           rating: 4.5,
                           reviewCount: 0)
        }
    }
}
