//
//  Extensions.swift
//  News App IOS
//
//  Created by Achitha Sandaruwan on 2022-09-28.
//

import SwiftUI
import RappleProgressHUD


extension View {
    
    //MARK: -  Activity Indicator
    // Start loading
    func startLoading() {
        RappleActivityIndicatorView.startAnimating(attributes: RappleActivityIndicatorView.attribute(style: RappleStyle.apple, tintColor:  UIColor(named: "primary")!, screenBG: UIColor(white: 0.0, alpha: 0.1) , progressBG: UIColor.clear))
    }
    
    // Start loading with text
    func startLoadingWithText(label: String) {
        RappleActivityIndicatorView.startAnimatingWithLabel(label)
    }
    
    // Stop loading
    func stopLoading() {
        RappleActivityIndicatorView.stopAnimation()
    }
    
    func startLoadingWithProgress(current: CGFloat, total:CGFloat) {
        RappleActivityIndicatorView.setProgress(current/total)
    }

}
