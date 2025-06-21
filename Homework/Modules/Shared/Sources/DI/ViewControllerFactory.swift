//
//  ViewControllerFactory.swift
//  Shared
//
//  Created by 윤재욱 on 6/21/25.
//

import UIKit

public protocol ViewControllerType: UIViewController {}

public protocol ViewControllerFactoryType {
    /// ViewController를 생성하는데 필요한 런타임 파라미터
    associatedtype Payload
    /// 런타임 파라미터를 받아 ViewController를 생성하는 클로저
    typealias FactoryClosure = (Payload) -> ViewControllerType
    
    var factoryClosure: FactoryClosure { get }
    /// ViewControllerType 생성 인터페이스
    func create(payload: Payload) -> ViewControllerType
}

public extension ViewControllerFactoryType {
    func create(payload: Payload) -> ViewControllerType {
        factoryClosure(payload)
    }
}
