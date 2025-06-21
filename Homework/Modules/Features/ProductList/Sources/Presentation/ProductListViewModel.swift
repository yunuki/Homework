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
    }
    
    struct State {
        var initialized: Bool = false
        var products: [Product] = []
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
        Task { await reduce(action) }
    }
    
    @MainActor
    private func reduce(_ action: Action) {
        var newState = state
        switch action {
        case .onAppear:
            Task {
                do {
                    let products = try await getProductListUseCase.execute()
                    sendAction(.onCompletedTask(products: products, error: nil))
                } catch {
                    sendAction(.onCompletedTask(products: [], error: error))
                }
            }
            
        case .onCompletedTask(let products, let error):
            newState.products = products
            newState.error = error
        }
        self.state = newState
    }
}
