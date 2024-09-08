//
//  Int + Extension.swift
//  Countries Info
//
//  Created by Ayokunle Fatokimi on 22/08/2024.
//

import Foundation

extension Int {
    
    // Comma Delimiter Method
    func addCommaDelimiter() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSeparator = ","
        return numberFormatter.string(from: .init(value: self)) ?? "\(self)"
    }
    
}

extension UInt {
    
    static var image200: UInt {
        return 200 as UInt
    }
}
