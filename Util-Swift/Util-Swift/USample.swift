//
//  USample.swift
//  Util-Swift
//
//  Created by Kyungwoo Park on 2018. 2. 13..
//  Copyright © 2018년 Kyungwoo Park. All rights reserved.
//

import Foundation


@objc public class USample:NSObject {
    
    private override init() {}
    
    @objc public static func doSomething() -> String{
        
        return "Util Sample Swift".test()
    }
    
}


extension String {

    public func test() -> String{
        
        return "Util Sample Swift"
    }
    
}
