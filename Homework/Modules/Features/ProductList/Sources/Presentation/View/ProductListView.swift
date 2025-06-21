//
//  ProductListView.swift
//  ProductList
//
//  Created by 윤재욱 on 6/21/25.
//

import SwiftUI

struct ProductListView: View {
    
    @StateObject var viewModel: ProductListViewModel
    
    init(viewModel: ProductListViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        LazyVGrid(columns: []) {
            
        }
    }
}
