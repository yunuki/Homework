//
//  View+Skeleton.swift
//  Common
//
//  Created by 윤재욱 on 6/21/25.
//

import SwiftUI

struct ShowSkeletonKey: EnvironmentKey {
    static let defaultValue: Bool = false
}

public extension EnvironmentValues {
    var showSkeleton: Bool {
        get { self[ShowSkeletonKey.self] }
        set { self[ShowSkeletonKey.self] = newValue }
    }
}

struct Skeleton: ViewModifier {
    
    let isOn: Bool
    let cornerRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color(UIColor.secondarySystemBackground))
                    .opacity(isOn ? 1 : 0)
                    .animation(.easeInOut(duration: 0.3), value: isOn)
                    .accessibility(label: Text("Skeleton"))
            )
    }
}

public extension View {
    func skeletonable(_ isOn: Bool, cornerRadius: CGFloat = 4) -> some View {
        modifier(Skeleton(isOn: isOn, cornerRadius: cornerRadius))
    }
}
