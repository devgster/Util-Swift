//
//  UIFont+extension.swift
//  Util-Swift
//
//  Created by Kyungwoo Park on 2018. 2. 13..
//  Copyright © 2018년 Kyungwoo Park. All rights reserved.
//

import Foundation


extension UIFont{
    public static func ratio(_ ofSize : CGFloat)->UIFont{
        return UIFont.systemFont(ofSize: ofSize*UIDevice.ratio)
    }
    
    public static func ratioBold(_ ofSize : CGFloat)->UIFont{
        return UIFont.systemFont(ofSize: ofSize*UIDevice.ratio, weight: UIFont.Weight.bold)
    }
    
    public static func ratio(_ ofSize : CGFloat, weight: UIFont.Weight)->UIFont{
        return UIFont.systemFont(ofSize: ofSize*UIDevice.ratio, weight: weight)
    }
    
}
