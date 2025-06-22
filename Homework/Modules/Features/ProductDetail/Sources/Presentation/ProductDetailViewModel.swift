//
//  ProductDetailViewModel.swift
//  ProductDetail
//
//  Created by 윤재욱 on 6/21/25.
//

import Foundation

final class ProductDetailViewModel: NSObject {
    
    enum Action {
        case onTapBackButton
    }
    
    let coordinator: ProductDetailCoordinating
    let linkURL: URL
    
    init(coordinator: ProductDetailCoordinating, linkURL: URL) {
        self.coordinator = coordinator
        self.linkURL = linkURL
    }
    
    func sendAction(_ action: Action) {
        Task { await reduce(action) }
    }
    
    @MainActor
    private func reduce(_ action: Action) {
        switch action {
        case .onTapBackButton:
            coordinator.pop()
        }
    }
}
