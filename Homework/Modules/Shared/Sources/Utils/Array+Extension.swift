//
//  Array+Extension.swift
//  Shared
//
//  Created by 윤재욱 on 6/22/25.
//

public extension Array {
    func chunked(into size: Int) -> [[Element]] {
        stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
}
