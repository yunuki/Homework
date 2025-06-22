//
//  Int+Extension.swift
//  Shared
//
//  Created by 윤재욱 on 6/21/25.
//

import Foundation

public extension Int {
    var formattedString: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.locale = Locale(identifier: "ko_KR")
        return numberFormatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}
