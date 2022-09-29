//
//  Fonts+Extentions.swift
//  News App IOS
//
//  Created by Achitha Sandaruwan on 2022-09-28.
//

import SwiftUI

enum NewsAppFonts: String {
    case NunitoBold = "Nunito Bold"
    case NunitoSemiBold = "Nunito SemiBold"
    case NunitoRegular = "Nunito Regular"
    case NunitoLight = "Nunito Light"
    case NunitoMedium = "Nunito Medium"
    case NunitoExtraLight = "Nunito ExtraLight"
    case NunitoExtraBold = "Nunito ExtraBold"
    case NunitoBlack = "Nunito Black"
    case NewYorkSemibold = "New York Small Semibold"
    case NewYorkBold = "New York Bold"
}

extension Font {
    static func customFont( _ name: NewsAppFonts, _ size: CGFloat) -> Font {
        return Font.custom(name.rawValue, size: size)
    }
}
