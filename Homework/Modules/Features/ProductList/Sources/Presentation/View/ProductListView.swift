//
//  ProductListView.swift
//  ProductList
//
//  Created by 윤재욱 on 6/21/25.
//

import SwiftUI

struct ProductListView: View {
    
    @StateObject var viewModel: ProductListViewModel
    private let columns = (0..<2).map { _ in GridItem(.flexible(minimum: 0), spacing: 16) }
    
    init(viewModel: ProductListViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(viewModel.state.products) { product in
                    ProductItemView(product: product)
                        .onTapGesture {
                            viewModel.sendAction(.onTapItem(product: product))
                        }
                        .disabled(viewModel.state.initialized)
                }
            }
            .padding(.horizontal, 16)
        }
        .onAppear {
            viewModel.sendAction(.onAppear)
        }
        .environment(\.showSkeleton, !viewModel.state.initialized)
    }
}
