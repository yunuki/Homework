//
//  BenefitTagView.swift
//  Common
//
//  Created by 윤재욱 on 6/21/25.
//

import SwiftUI

import DesignSystem

public struct BenefitTagView: View {
    
    let benefit: String
    
    public init(benefit: String) {
        self.benefit = benefit
    }
    
    public var body: some View {
        Text(benefit)
            .typography(.caption2)
            .padding(EdgeInsets(top: 2, leading: 4, bottom: 2, trailing: 4))
            .overlay(Capsule().strokeBorder(.gray))
    }
}

#Preview {
    BenefitTagView(benefit: "쿠폰20,000원")
}
