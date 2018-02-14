//
//  UIDevice+extension.swift
//  Util-Swift
//
//  Created by Kyungwoo Park on 2018. 2. 13..
//  Copyright © 2018년 Kyungwoo Park. All rights reserved.
//

import Foundation
import CoreTelephony



@objc public enum DisplayType:NSInteger {
    case unknown
    case iphone4
    case iphone5
    case iphone6
    case iphone6plus
    static let iphone7 = iphone6
    static let iphone7plus = iphone6plus
    static let iphone8 = iphone6
    static let iphone8plus = iphone6plus
    case iphoneX
}

@objc extension UIDevice {
    
    public static var width:CGFloat { return UIScreen.main.bounds.size.width }
    public static var height:CGFloat { return UIScreen.main.bounds.size.height }
    public static var ratio:CGFloat { return width / 414.0 }
    public static var maxLength:CGFloat { return max(width, height) }
    public static var minLength:CGFloat { return min(width, height) }
    public static var zoomed:Bool { return UIScreen.main.nativeScale >= UIScreen.main.scale }
    public static var retina:Bool { return UIScreen.main.scale >= 2.0 }
    public static var phone:Bool { return UIDevice.current.userInterfaceIdiom == .phone }
    public static var pad:Bool { return UIDevice.current.userInterfaceIdiom == .pad }
    public static var carplay:Bool { return UIDevice.current.userInterfaceIdiom == .carPlay }
    public static var tv:Bool { return UIDevice.current.userInterfaceIdiom == .tv }
    @objc public static var typeIsLike:DisplayType {
        if phone && maxLength < 568 {
            return .iphone4
        }
        else if phone && maxLength == 568 {
            return .iphone5
        }
        else if phone && maxLength == 667 {
            return .iphone6
        }
        else if phone && maxLength == 736 {
            return .iphone6plus
        }
        else if phone && maxLength == 812 {
            return .iphoneX
        }
        return .unknown
    }
    
    @objc public static var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
        case "iPod5,1":                                 return "iPod Touch 5"
        case "iPod7,1":                                 return "iPod Touch 6"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
        case "iPhone4,1":                               return "iPhone 4s"
        case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
        case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
        case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
        case "iPhone7,2":                               return "iPhone 6"
        case "iPhone7,1":                               return "iPhone 6 Plus"
        case "iPhone8,1":                               return "iPhone 6s"
        case "iPhone8,2":                               return "iPhone 6s Plus"
        case "iPhone8,4":                               return "iPhone SE"
        case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
        case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
        case "iPhone10,1", "iPhone10,4":                return "iPhone 8"
        case "iPhone10,2", "iPhone10,5":                return "iPhone 8 Plus"
        case "iPhone10,3", "iPhone10,6":                return "iPhone X"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
        case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
        case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
        case "iPad6,3", "iPad6,4", "iPad6,7", "iPad6,8":return "iPad Pro"
        case "AppleTV5,3":                              return "Apple TV"
        case "i386", "x86_64":                          return "Simulator"
        default:                                        return identifier
        }
    }
    
    //유심 정보
    //KT - 08450
    //SK - 11450
    public static var networkOperator:String {
        let networkInfo = CTTelephonyNetworkInfo()
        let carrier: CTCarrier? = networkInfo.subscriberCellularProvider;
        
        let countryNetworkCode = Int((carrier?.mobileCountryCode ?? "0")!);
        let mobileNetworkCode = Int((carrier?.mobileNetworkCode ?? "0")!);
        
        if countryNetworkCode == 0 && mobileNetworkCode == 0 {
            return ""
        }
        return String(format: "%03d%02d", countryNetworkCode!, mobileNetworkCode!);
    }
    
    public static var carrierName:String {
        let networkInfo = CTTelephonyNetworkInfo()
        let carrier: CTCarrier? = networkInfo.subscriberCellularProvider;
        
        if let cName = carrier?.carrierName {
            return cName
        }
        return ""
    }
    
    
    public static var country: String{
        var deviceCountryISO: String? = nil
        let networkInfo = CTTelephonyNetworkInfo()
        let carrier: CTCarrier? = networkInfo.subscriberCellularProvider
        deviceCountryISO = carrier?.isoCountryCode?.uppercased()
        if deviceCountryISO == nil {
            deviceCountryISO = (Locale.current as NSLocale).object(forKey: .countryCode) as? String;
        }
        return deviceCountryISO!;
    }
    
    public static var countryShort:String{
        var deviceCountryISO: String = self.country
        if deviceCountryISO.count > 2 {
            deviceCountryISO  = deviceCountryISO.substring(to: 2);
        }
        return deviceCountryISO
    }
    
    public static var language:String{
        let deviceLanguage: String = NSLocale.preferredLanguages[0]
        return deviceLanguage
    }
    
    public static var languageShort:String {
        var deviceLanguage: String = self.language
        let cutLanguage = deviceLanguage.components(separatedBy: "-")
        if cutLanguage.count > 1 {
            deviceLanguage = cutLanguage[0]
        }
        return deviceLanguage
    }
    
}
