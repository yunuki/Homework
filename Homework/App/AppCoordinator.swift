//
//  AppCoordinator.swift
//  Homework
//
//  Created by 윤재욱 on 6/21/25.
//

import UIKit

import ProductListPresentation

import Swinject

final class AppCoordinator: ProductListCoordinating  {
    let window: UIWindow
    let resolver: Resolver
    let navigationController = UINavigationController()
    
    init(window: UIWindow, resolver: Resolver) {
        self.window = window
        self.resolver = resolver
    }
    
    func start() {
        window.rootViewController = navigationController
        let factory = resolver.resolve(ProductListViewControllerFactory.self)!
        let viewController = factory.create(payload: self)
        navigationController.setViewControllers([viewController], animated: false)
        window.makeKeyAndVisible()
    }
    
    func showProductDetail(id: String) {
        
    }
}
