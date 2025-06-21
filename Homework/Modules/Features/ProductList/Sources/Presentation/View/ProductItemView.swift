//
//  ProductItemView.swift
//  ProductList
//
//  Created by 윤재욱 on 6/21/25.
//

import SwiftUI

import DesignSystem
import ProductListDomain
import UI
import Utils

struct ProductItemView: View {
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            thumbnail
            title
            price
            tags
            benefits
            rating
            Spacer()
        }
    }
    
    private var thumbnail: some View {
        GeometryReader { proxy in
            ImageView(product.base.imageURL, size: CGSize(width: proxy.size.width, height: proxy.size.width))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        .aspectRatio(1, contentMode: .fit)
    }
    
    private var title: some View {
        Text(product.base.brand)
            .font(.system(size: Typography.body.fontSize, weight: .bold)) +
        Text(" \(product.base.name)")
            .font(.system(size: Typography.body.fontSize))
    }
    
    @ViewBuilder
    private var price: some View {
        if product.base.discountRate > 0 {
            VStack(alignment: .leading, spacing: 0) {
                Text("\(product.base.price.formattedString)원")
                    .foregroundColor(.gray)
                    .strikethrough(color: .gray)
                    .typography(.caption1)
                HStack(spacing: 0) {
                    Text("\(product.base.discountRate)%")
                        .foregroundColor(.red)
                        .typography(.body, weight: .bold)
                    Spacer().frame(width: 4)
                    Text(product.base.discountPrice.formattedString)
                        .typography(.body, weight: .bold)
                    Text("원")
                        .typography(.body)
                }
            }
        } else {
            HStack(spacing: 0) {
                Text(product.base.discountPrice.formattedString)
                    .typography(.body, weight: .bold)
                Text("원")
                    .typography(.body)
            }
        }
    }
    
    private var tags: some View {
        FlowLayout(items: product.tags.flatMap { [$0, "・"] }.dropLast(), spacing: 2) { index, tag in
            Text(tag)
                .typography(.caption1)
        }
    }
    
    @ViewBuilder
    private var benefits: some View {
        if product.benefits.isEmpty {
            EmptyView()
        } else {
            FlowLayout(items: product.benefits, spacing: 4) { index, benefit in
                BenefitTagView(benefit: benefit)
            }
        }
    }
    
    private var rating: some View {
        HStack(alignment: .firstTextBaseline, spacing: 2) {
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 8, height: 8)
            Text(String(format: "%.1f점", product.rating))
                .typography(.caption1)
            Text("\(product.reviewCount.formattedString)건")
                .typography(.caption1)
        }
        .foregroundColor(.gray)
    }
}
