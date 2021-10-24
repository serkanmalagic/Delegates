//
//  Extensions.swift
//  Delegates
//
//  Created by Serkan Mehmet Malagiç on 24.10.2021.
//

import Foundation
import UIKit
import NVActivityIndicatorView

extension UIView{
    
    func createSpinner() -> NVActivityIndicatorView{
        let x = self.frame.width / 2 - 25
        let y = self.frame.height / 2
        
        return createSpinner(x: x, y: y)
    }
    
    func createSpinner(x: CGFloat, y: CGFloat) -> NVActivityIndicatorView{
        var activityView : NVActivityIndicatorView!
        if activityView == nil{
            activityView = NVActivityIndicatorView(frame: CGRect(x: x, y: y, width: 50, height: 50), type: NVActivityIndicatorType.lineSpinFadeLoader, color: UIColor.lightGray, padding: 0.0)
            self.addSubview(activityView)
        }
        return activityView
    }
}
