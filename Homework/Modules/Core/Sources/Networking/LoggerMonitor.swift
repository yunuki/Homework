//
//  LoggerMonitor.swift
//  Core
//
//  Created by 윤재욱 on 6/21/25.
//

import Foundation

import Logging

import Alamofire

final class LoggerMonitor: EventMonitor {
    let queue = DispatchQueue(label: "com.homework.logger")
    
    func requestDidResume(_ request: Request) {
        Logger.shared.info(message: "Resuming: \(request)", category: .api)
    }
    
    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        var message: Any
        if let url = request.convertible.urlRequest?.url {
            message = "[\(url.host ?? "nil")] \(url.path) \(url.query ?? "")"
        } else {
            message = request
        }

        switch response.result {
        case .success(let value):
            Logger.shared.debug(message: "\(message) \(value)", category: .api)
        case .failure(let error):
            Logger.shared.error(message: "\(message) \(error)", category: .api)
        }
    }
}
