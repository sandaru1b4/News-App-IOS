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
}

extension Color {
    static func custom( _ name: NewsAppColors) -> Color {
        return Color(name.rawValue)
    }
}
