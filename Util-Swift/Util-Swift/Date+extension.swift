//
//  Date+extension.swift
//  Util-Swift
//
//  Created by Kyungwoo Park on 2018. 2. 13..
//  Copyright © 2018년 Kyungwoo Park. All rights reserved.
//

import Foundation

extension Date{
    
    public static func fromString(_ string:String, format:String)->Date{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from:string)!
    }
    
    public func toString(format:String)->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from:self as Date)
    }
    
    public func toStringLocal(format:String)->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.calendar = NSCalendar.current
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = NSLocale.current
        return dateFormatter.string(from:self as Date)
    }
    
    public var toMilliseconds:Int {
        return Int((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    public static func fromMilliseconds(milliseconds:Int)->Date {
        return Date(timeIntervalSince1970: TimeInterval(milliseconds / 1000))
    }
    
}
