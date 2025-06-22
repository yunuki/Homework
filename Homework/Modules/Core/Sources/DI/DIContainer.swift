//
//  DIContainer.swift
//  Shared
//
//  Created by 윤재욱 on 6/21/25.
//

import Swinject

public final class DIContainer {
    public static let shared = DIContainer()
    
    private let container = Container()
    private lazy var assembler = Assembler(container: container)
    private var _resolver: Resolver?
    /// registerAll(_ :) 호출 이후에 참조
    public var resolver: Resolver {
        guard let _resolver else {
            fatalError("DIContainer is not configured")
        }
        return _resolver
    }
    
    public func registerAll(_ assemblies: [Assembly]) {
        assembler.apply(assemblies: assemblies)
        self._resolver = container.synchronize()
    }
}
