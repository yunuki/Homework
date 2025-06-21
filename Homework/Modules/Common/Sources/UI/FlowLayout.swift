//
//  FlowLayout.swift
//  Common
//
//  Created by 윤재욱 on 6/21/25.
//

import SwiftUI

public struct FlowLayout<Item, Content>: View where Item: Hashable, Content: View {
    let items: [Item]
    let spacing: CGFloat
    let content: (Int, Item) -> Content

    @State private var totalHeight: CGFloat = .zero
    
    public init(items: [Item], spacing: CGFloat, content: @escaping (Int, Item) -> Content) {
        self.items = items
        self.spacing = spacing
        self.content = content
    }

    public var body: some View {
        GeometryReader { geometry in
            self.generateContent(in: geometry)
        }
        .frame(height: totalHeight)
        .onPreferenceChange(ViewHeightKey.self) { totalHeight = $0 }
    }

    private func generateContent(in geometry: GeometryProxy) -> some View {
        var trailingOffset: CGFloat = 0
        var bottomOffset: CGFloat = 0

        return ZStack(alignment: .topLeading) {
            ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                content(index, item)
                    .alignmentGuide(.leading) { guide in
                        if (abs(trailingOffset - guide.width) > geometry.size.width) {
                            trailingOffset = 0
                            bottomOffset -= guide.height + spacing
                        }
                        let result = trailingOffset
                        if item == items.last {
                            trailingOffset = 0
                        } else {
                            trailingOffset -= guide.width + spacing
                        }
                        return result
                    }
                    .alignmentGuide(.top) { _ in
                        let result = bottomOffset
                        if item == items.last {
                            bottomOffset = 0
                        }
                        return result
                    }
            }
        }
        .background(heightReader)
    }
    
    private var heightReader: some View {
        GeometryReader { geo in
            Color.clear
                .preference(key: ViewHeightKey.self, value: geo.size.height)
        }
    }
}

struct ViewHeightKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}
