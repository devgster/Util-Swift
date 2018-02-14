//
//  UITextField+extension.swift
//  Util-Swift
//
//  Created by Kyungwoo Park on 2018. 2. 13..
//  Copyright © 2018년 Kyungwoo Park. All rights reserved.
//

import Foundation


extension UITextField {
    public func placeholder(_ placeholder: String, color: UIColor) {
        self.placeholder(placeholder, color: color, font: self.font!)
    }
    
    public func placeholder(_ placeholder: String, color: UIColor, font: UIFont) {
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor: color, .font: font])
    }
}
