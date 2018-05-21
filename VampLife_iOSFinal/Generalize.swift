//
//  Generalize.swift
//  VampLife_iOSFinal
//
//  Created by Brittany Darby on 05/09/18.
//  Copyright © 2018 Brittany Darby. All rights reserved.
//

import UIKit

class Generalize : NSObject{
    
    static var clubObj : ClubObjects? = nil
    
    static func get_cordinates(myStr : String) -> String{
        var startPos = 0
        var endPos = 0
        if let start_range = myStr.range(of: "location="){
            startPos = myStr.distance(from: myStr.startIndex, to: start_range.upperBound)
        }
        if let end_range = myStr.range(of: "&radius"){
            endPos = myStr.distance(from: myStr.startIndex, to: end_range.lowerBound)
        }
        return String(myStr[startPos..<endPos])
    }
    
}


