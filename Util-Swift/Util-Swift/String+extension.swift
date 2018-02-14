//
//  String+extension.swift
//  Util-Swift
//
//  Created by Kyungwoo Park on 2018. 2. 13..
//  Copyright © 2018년 Kyungwoo Park. All rights reserved.
//

import Foundation

var kLocalizedDefaultLangugeISO:String? = "en"

extension String {
    
    public func sizeWithFont(font:UIFont) -> CGSize {
        let newSize: CGSize = self.size(withAttributes: [.font: font]);
        return newSize;
    }
    
    public func sizeWithFont(font:UIFont, constrainedToSize:CGSize) -> CGSize {
        let newSize: CGSize = self.boundingRect(with: constrainedToSize, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil).size;
        
        return CGSize.init(width: newSize.width, height: newSize.height);
    }
    
    public func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
    
    public func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        let newStr = String(self[fromIndex...])
        return newStr
    }
    
    public func substring(to: Int) -> String {
        let toIndex = index(from: to)
        let newStr = String(self[..<toIndex])
        return newStr
    }
    
    public func substring(with r: Range<Int>) -> String {

        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        
        let range = startIndex..<endIndex
        let newStr = String(self[range])
        
        return newStr
    }
    
    public func substring(with nsrange: NSRange) -> String? {
        guard let range = Range(nsrange, in: self) else { return nil }
        return String(self[range])
    }
    
    public func contains(_ find: String) -> Bool{
        return self.range(of: find) != nil
    }
    public func containsIgnoringCase(_ find: String) -> Bool{
        return self.range(of: find, options: .caseInsensitive) != nil
    }
    //MARK: - Validation
    public var isValidEmail:Bool {
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: self)
        return result
    }
    
    public var isValidPhoneNumber:Bool {
        let PHONE_REGEX = "^01(?:0|1|[6-9])([0-9]{3,4})[0-9]{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: self)
        return result
    }
    
    //MARK: - 지역화
    
    public func localized(hint:String)->String{
        return self.localized
    }
    
    public var localized: String {
        var localizedString = NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
        
        let language:String = NSLocale.preferredLanguages[0]
        
        //번역이 없을 경우 기본 언어로..
        if kLocalizedDefaultLangugeISO != nil {
            if language.contains(kLocalizedDefaultLangugeISO!) == false && localizedString == self {
                localizedString = (Bundle(path: Bundle.main.path(forResource: kLocalizedDefaultLangugeISO, ofType: "lproj") ?? "")?.localizedString(forKey: self, value: "", table: nil))!
            }
        }

        if localizedString == self {
            fatalError("번역 없음!! forKey:'\(self)'")
        }
        
        localizedString = localizedString.replacingOccurrences(of: "%s", with: "%@")
        
        return localizedString
    }
}
