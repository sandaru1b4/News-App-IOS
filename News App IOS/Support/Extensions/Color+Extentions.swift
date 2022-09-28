//
//  Color+Extentions.swift
//  News App IOS
//
//  Created by Achitha Sandaruwan on 2022-09-28.
//

import SwiftUI

enum NewsAppColors: String {
    case primary
    case secondary
    case tertiary
    case TabBarSelectTxtClr
    case tabBarDeselectTxtClr
    case _E0E0E0 = "#E0E0E0"
    case _818181 = "#818181"
}

extension Color {
    static func custom( _ name: NewsAppColors) -> Color {
        return Color(name.rawValue)
    }
}
