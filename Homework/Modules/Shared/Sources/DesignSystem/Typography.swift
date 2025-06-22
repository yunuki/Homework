//
//  Typography.swift
//  Shared
//
//  Created by 윤재욱 on 6/21/25.
//

import SwiftUI

public enum Typography: String, CaseIterable {
    case title
    case body
    case caption1
    case caption2
    
    public var fontSize: CGFloat {
        switch self {
        case .title:
            return 18
        case .body:
            return 14
        case .caption1:
            return 10
        case .caption2:
            return 8
        }
    }
    
    public var fontHeight: CGFloat {
        return UIFont.systemFont(ofSize: self.fontSize).lineHeight
    }
    
    public var lineHeight: CGFloat {
        switch self {
        case .title, .body, .caption1, .caption2:
            return fontSize * 1.5
        }
    }
}

struct TypographyViewModifier: ViewModifier {
    let typography: Typography
    let weight: Font.Weight
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: typography.fontSize, weight: weight))
            .lineSpacing(typography.lineHeight - typography.fontHeight)
            .padding(.vertical, (typography.lineHeight - typography.fontHeight) / 2)
    }
}

public extension View {
    func typography(_ typography: Typography, weight: Font.Weight = .regular) -> some View {
        modifier(TypographyViewModifier(typography: typography, weight: weight))
    }
}
