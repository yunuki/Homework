//
//  HTTPClient.swift
//  Core
//
//  Created by 윤재욱 on 6/21/25.
//

import Foundation

import Alamofire

public protocol HTTPClient {
    func request <R: Decodable>(_ request: URLRequest, type: R.Type) async throws -> R
}

final class HTTPClientImpl: HTTPClient {
    
    private let session: Session
    
    init() {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 10
        configuration.timeoutIntervalForResource = 5 * 60
        self.session = Session(configuration: configuration, eventMonitors: [LoggerMonitor()])
    }
    
    func request<R: Decodable>(_ request: URLRequest, type: R.Type) async throws -> R {
        try await session.request(request)
            .serializingDecodable(R.self)
            .value
    }
}
