//
//  ProductListView.swift
//  ProductList
//
//  Created by 윤재욱 on 6/21/25.
//

import SwiftUI

import ProductListDomain
import UI

struct ProductListView: View {
    
    @StateObject var viewModel: ProductListViewModel
    private let horizontalSpacing: CGFloat = 16
    private let horizontalPadding: CGFloat = 16
    private let verticalPadding: CGFloat = 8
    private let columnCount: Int = 2
    
    init(viewModel: ProductListViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        GeometryReader { proxy in
            let columnWidth = (proxy.size.width - (horizontalSpacing + horizontalPadding * 2)) / CGFloat(columnCount)
            let chunked = viewModel.state.products.chunked(into: columnCount)
            
            CompatibleListView(data: Array(chunked.enumerated()), id: \.offset) { rowIndex, row in
                rowView(row, columnWidth: columnWidth)
            }
        }
        .onAppear {
            viewModel.sendAction(.onAppear)
        }
    }
    
    private func rowView(_ row: [Product], columnWidth: CGFloat) -> some View {
        HStack(spacing: horizontalSpacing) {
            ForEach(Array(row.enumerated()), id: \.offset) { colIndex, product in
                ProductItemView(product: product, width: columnWidth)
                    .onTapGesture {
                        viewModel.sendAction(.onTapItem(product: product))
                    }
                    .environment(\.showSkeleton, !viewModel.state.initialized)
                    .disabled(!viewModel.state.initialized)
            }
            // 비어 있는 셀을 채우기 위한 패딩
            if row.count == 1 {
                Spacer()
            }
        }
        .padding(.horizontal, horizontalPadding)
        .padding(.vertical, verticalPadding)
    }
}
