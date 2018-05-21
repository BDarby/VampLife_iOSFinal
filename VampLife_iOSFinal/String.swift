//
//  String.swift
//  VampLife_iOSFinal
//
//  Created by Brittany Darby on 05/09/18.
//  Copyright © 2018 Brittany Darby. All rights reserved.
//

import Foundation

public extension String {

    subscript (bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start..<end])
    }
    
}
