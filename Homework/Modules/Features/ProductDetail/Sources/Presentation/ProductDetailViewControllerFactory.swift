//
//  ProductDetailViewControllerFactory.swift
//  ProductDetail
//
//  Created by 윤재욱 on 6/21/25.
//

import Foundation

import DI

public struct ProductDetailViewControllerFactory: ViewControllerFactoryType {
    public struct Payload {
        let coordinator: ProductDetailCoordinating
        let linkURL: URL
        
        public init(coordinator: ProductDetailCoordinating, linkURL: URL) {
            self.coordinator = coordinator
            self.linkURL = linkURL
        }
    }
    public var factoryClosure: FactoryClosure
}
