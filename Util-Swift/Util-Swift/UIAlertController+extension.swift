//
//  UIAlertController+extension.swift
//  Util-Swift
//
//  Created by Kyungwoo Park on 2018. 2. 13..
//  Copyright © 2018년 Kyungwoo Park. All rights reserved.
//

import Foundation


extension UIAlertController{
    
    //MARK: - .alert
    public static func alert(title: String?, message: String?, onTarget:UIViewController, defaultTitle:String?, defaultHandler: ((UIAlertAction) -> Swift.Void)? = nil, cancelTitle:String?,  cancelhandler: ((UIAlertAction) -> Swift.Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if cancelTitle != nil {
            let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel, handler: cancelhandler)
            alertController.addAction(cancelAction)
        }
        
        if defaultTitle != nil {
            let defaultAction = UIAlertAction(title: defaultTitle, style: .default, handler: defaultHandler)
            alertController.addAction(defaultAction)
        }
        
        onTarget.present(alertController, animated: true) {
            
        }
    }
    
    //기본 버튼만 있을 경우..
    public static func alert(title: String?, message: String?, onTarget:UIViewController, defaultTitle:String?, defaultHandler: ((UIAlertAction) -> Swift.Void)? = nil) {
        self.alert(title: title,
                   message: message,
                   onTarget: onTarget,
                   defaultTitle: defaultTitle,
                   defaultHandler: defaultHandler,
                   cancelTitle: nil,
                   cancelhandler: nil)
    }
    //취소 버튼만 있을 경우..
    public static func alert(title: String?, message: String?, onTarget:UIViewController, cancelTitle:String?, cancelhandler: ((UIAlertAction) -> Swift.Void)? = nil) {
        self.alert(title: title,
                   message: message,
                   onTarget: onTarget,
                   defaultTitle: nil,
                   defaultHandler: nil,
                   cancelTitle: cancelTitle,
                   cancelhandler: cancelhandler)
    }
    
    
    //MARK: - .actionSheet
    public static func actionSheet(title: String?, message: String?, onTarget:UIViewController, otherButtonTitles:[String]?, cancelTitle:String?, otherHandler: ((UIAlertAction, Int) -> Swift.Void)? = nil, cancelhandler: ((UIAlertAction) -> Swift.Void)? = nil) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        if cancelTitle != nil {
            let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel, handler: cancelhandler)
            alertController.addAction(cancelAction)
        }
        
        if otherButtonTitles != nil {
            for i in 0..<Int((otherButtonTitles?.count)!) {
                let title = otherButtonTitles![i]
                
                let otherAction = UIAlertAction(title: title, style: .default) { (action) in
                    otherHandler!(action, i)
                }
                alertController.addAction(otherAction)
            }
        }
        
        onTarget.present(alertController, animated: true) {
            
        }
    }
}


