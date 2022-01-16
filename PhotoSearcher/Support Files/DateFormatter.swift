//
//  DateFormatter.swift
//
//  Created by Alex Pupko on 27.09.21.
//  Copyright © 2021 Alex Pupko. All rights reserved.
//

import Foundation
import UIKit

// MARK: - DateFormatter
extension DateFormatter {
    static func moneyCurrentDay() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm d/MM"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        return dateFormatter
    }

}

extension String {
    func maxLength(length: Int) -> String {
        var str = self
        let nsString = str as NSString
        
        if nsString.length >= length {
            str = nsString.substring(with:
                                        NSRange(
                                            location: 0,
                                            length: nsString.length > length ? length : nsString.length)
            )
        }
        return  str
    }
    
}
