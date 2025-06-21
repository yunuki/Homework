//
//  Logger.swift
//  Shared
//
//  Created by 윤재욱 on 6/21/25.
//

import Foundation
import os

public class Logger {

    public enum Category: String {
        case `default` = "Default"
        case api = "API"
    }
    
    public init() { }
    public static let shared = Logger()

    public func debug(message: Any, category: Category = .default) {
        log("\(message)", level: .debug, category: category)
    }

    public func error(message: Any, category: Category = .default) {
        log("\(message)", level: .error, category: category)
    }

    public func info(message: Any, category: Category = .default) {
        log("\(message)", level: .info, category: category)
    }

    public func warning(message: Any, category: Category = .default) {
        log("\(message)", level: .default, category: category)
    }

    public func log(_ message: String, level: OSLogType, category: Category) {
        log(message, level: level, category: category.rawValue)
    }

    public func log(_ message: String, level: OSLogType, category: String) {
        let logger = os.Logger(subsystem: Bundle.main.bundleIdentifier ?? "com.yunuki.homework", category: category)
        logger.log(level: level, "\(message, privacy: .private)")
    }
}
