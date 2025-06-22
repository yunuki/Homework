//
//  AppCoordinator.swift
//  Homework
//
//  Created by 윤재욱 on 6/21/25.
//

import UIKit

import ProductDetailPresentation
import ProductListPresentation
import UI

import Swinject

final class AppCoordinator  {
    let window: UIWindow
    let resolver: Resolver
    let navigationController = NavigationController()
    
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
}

extension AppCoordinator: ProductListCoordinating {
    func showProductDetail(linkURL: URL) {
        let factory = resolver.resolve(ProductDetailViewControllerFactory.self)!
        let payload = ProductDetailViewControllerFactory.Payload(coordinator: self, linkURL: linkURL)
        let viewController = factory.create(payload: payload)
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension AppCoordinator: ProductDetailCoordinating {
    func pop() {
        navigationController.popViewController(animated: true)
    }
}
