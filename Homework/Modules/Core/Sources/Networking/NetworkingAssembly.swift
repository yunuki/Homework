//
//  NetworkingAssembly.swift
//  Core
//
//  Created by 윤재욱 on 6/21/25.
//

import Swinject

public struct NetworkingAssembly: Assembly {
    public func assemble(container: Container) {
        container.register(HTTPClient.self) { _ in
            HTTPClientImpl()
        }
        .inObjectScope(.container)
    }
}
