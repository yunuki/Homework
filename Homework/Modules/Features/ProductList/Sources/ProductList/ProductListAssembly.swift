//
//  ProductListAssembly.swift
//  ProductList
//
//  Created by 윤재욱 on 6/21/25.
//

import ProductListData
import ProductListDomain
import ProductListPresentation

import Swinject

public struct ProductListAssembly: Assembly {
    public init() {}
    
    public func assemble(container: Container) {
        ProductListDataAssembly().assemble(container: container)
        ProductListDomainAssembly().assemble(container: container)
        ProductListPresentationAssembly().assemble(container: container)
    }
}
