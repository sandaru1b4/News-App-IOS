//
//  DeviceScreenSizes.swift
//  News App IOS
//
//  Created by Achitha Sandaruwan on 2022-09-28.
//

import SwiftUI

struct Screen {
    
    static let width = UIScreen.main.bounds.width
    static let heigth = UIScreen.main.bounds.height
    
    
    static func sizeFromWidth(size: CGFloat) -> CGFloat {
        var width: CGFloat
        width = Screen.width * size / 375
        return width
    }
    
    static func sizeFromHeight(size: CGFloat) -> CGFloat {
        var height: CGFloat
        height = Screen.heigth * size / 667
        return height
    }
    
}
