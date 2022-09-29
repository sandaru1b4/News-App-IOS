//
//  FloatingBtnView.swift
//  News App IOS
//
//  Created by Achitha Sandaruwan on 2022-09-28.
//

import SwiftUI

struct FloatingBtnView: View {
    
    //MARK: - BODY
    var body: some View {
        
            Image(.appImages(.ic_favourite))
                .foregroundColor(.white)
                .padding(16)
                .background(
                Circle()
                    .fill(Color.custom(.primary))
                )
        
    }
}

//MARK: - PREVIEW
struct FloatingBtnView_Previews: PreviewProvider {
    static var previews: some View {
        FloatingBtnView()
    }
}
