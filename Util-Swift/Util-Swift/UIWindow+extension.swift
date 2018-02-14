//
//  UIWindow+extension.swift
//  Util-Swift
//
//  Created by Kyungwoo Park on 2018. 2. 13..
//  Copyright © 2018년 Kyungwoo Park. All rights reserved.
//

import Foundation


extension UIWindow {
    
    //window 에 활성화 되어있는 뷰 컨트롤러를 반환
    public func visibleViewController() -> UIViewController? {
        if let rootViewController: UIViewController  = self.rootViewController {
            return UIWindow.getVisibleViewControllerFrom(vc: rootViewController)
        }
        return nil
    }
    
    private static func getVisibleViewControllerFrom(vc:UIViewController) -> UIViewController {
        
        if vc.isKind(of: UINavigationController.self) {
            
            let navigationController = vc as! UINavigationController
            return UIWindow.getVisibleViewControllerFrom( vc: navigationController.visibleViewController!)
            
        } else if vc.isKind(of: UITabBarController.self) {
            
            let tabBarController = vc as! UITabBarController
            return UIWindow.getVisibleViewControllerFrom(vc: tabBarController.selectedViewController!)
            
        } else {
            
            if let presentedViewController = vc.presentedViewController {
                
                return UIWindow.getVisibleViewControllerFrom(vc: presentedViewController)
                
            } else {
                return vc;
            }
        }
    }
    
}
