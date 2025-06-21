//
//  ProductListViewControllerFactory.swift
//  ProductList
//
//  Created by 윤재욱 on 6/21/25.
//

import DI

public struct ProductListViewControllerFactory: ViewControllerFactoryType {
    public typealias Payload = ProductListCoordinating
    public var factoryClosure: FactoryClosure
}
