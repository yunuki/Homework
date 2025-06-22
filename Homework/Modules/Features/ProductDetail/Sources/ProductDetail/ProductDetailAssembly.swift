//
//  ProductDetailAssembly.swift
//  ProductDetail
//
//  Created by 윤재욱 on 6/21/25.
//

import ProductDetailPresentation

import Swinject

public struct ProductDetailAssembly: Assembly {
    public init() {}
    
    public func assemble(container: Container) {
        ProductDetailPresentationAssembly().assemble(container: container)
    }
}
