//
//  Image+Extentions.swift
//  News App IOS
//
//  Created by Achitha Sandaruwan on 2022-09-28.
//

import SwiftUI

enum NewsAppImages: String {
    case ic_favourite
    case ic_home
    case ic_profile
}

extension String {
    static func appImages(_ name: NewsAppImages) -> String {
        return name.rawValue
    }
}
