//
//  Util.swift
//  Util-Swift
//
//  Created by Kyungwoo Park on 2018. 2. 13..
//  Copyright © 2018년 Kyungwoo Park. All rights reserved.
//

import Foundation

//MARK: - OS Version
public let IS_OS_7_OR_LATER = (Float(UIDevice.current.systemVersion) ?? 0.0 >= 7.0)
public let IS_OS_8_OR_LATER = (Float(UIDevice.current.systemVersion) ?? 0.0 >= 8.0)
public let IS_OS_9_OR_LATER = (Float(UIDevice.current.systemVersion) ?? 0.0 >= 9.0)
public let IS_OS_10_OR_LATER = (Float(UIDevice.current.systemVersion) ?? 0.0 >= 10.0)
public let IS_OS_11_OR_LATER = (Float(UIDevice.current.systemVersion) ?? 0.0 >= 11.0)

//MARK: - RATIO METHOD
public func RATIO(_ point:CGFloat)->CGFloat{return point*UIDevice.ratio}
public func RATIO_RECT(x:CGFloat,y:CGFloat,width:CGFloat,height:CGFloat)->CGRect{return CGRect(x: RATIO(x), y: RATIO(y), width: RATIO(width), height: RATIO(height))}
public func RATIO_EDGE(top:CGFloat, left:CGFloat, bottom:CGFloat, right:CGFloat)->UIEdgeInsets{return UIEdgeInsetsMake(RATIO(top), RATIO(left), RATIO(bottom), RATIO(right))}
public func RATIO_BOLD(_ ofSize : CGFloat)->UIFont{return UIFont.ratioBold(ofSize)}
public func RATIO_FONT(_ ofSize : CGFloat)->UIFont{return UIFont.ratio(ofSize)}

//MARK: - DEBUG PRINT
public func print(debug: Any = "", function: String = #function, file: String = #file, line: Int = #line) {
    #if DEBUG
        var filename: NSString = file as NSString
        filename = filename.lastPathComponent as NSString
        Swift.print("< 파일: \(filename), 라인: \(line), 함수: \(function) >\n\(debug)\n")
    #endif
}

@objc public class Util:NSObject {
    
    private override init() {}
    
    @objc public static func doSomething() -> String{
        
        return "Util Swift"
    }
    
}


