//
//  CompatibleList.swift
//  Common
//
//  Created by 윤재욱 on 6/22/25.
//

import SwiftUI

public struct CompatibleListView<RowData, ID: Hashable, Content: View>: View {
    let data: [RowData]
    let id: KeyPath<RowData, ID>
    let rowBuilder: (RowData) -> Content
    
    public init(data: [RowData],
                id: KeyPath<RowData, ID>,
                @ViewBuilder rowBuilder: @escaping (RowData) -> Content) {
        self.data = data
        self.id = id
        self.rowBuilder = rowBuilder
        
        // iOS 14 이하에서 separator 숨기기
        if #available(iOS 15.0, *) {
            // ViewModifier로 처리
        } else {
            UITableView.appearance().separatorStyle = .none
        }
    }
    
    public var body: some View {
        List {
            ForEach(data, id: id) { item in
                rowBuilder(item)
                    .hideListSeparatorIfAvailable()
                    .listRowInsets(EdgeInsets()) // padding 제거
            }
        }
        .listStyle(.plain)
    }
}

private struct HideListSeparatorModifier: ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            content
                .listRowSeparator(.hidden)
        }
    }
}

private extension View {
    func hideListSeparatorIfAvailable() -> some View {
        self.modifier(HideListSeparatorModifier())
    }
}
