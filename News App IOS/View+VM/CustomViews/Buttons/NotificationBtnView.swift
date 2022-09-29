//
//  NotificationBtnView.swift
//  News App IOS
//
//  Created by Achitha Sandaruwan on 2022-09-28.
//

import SwiftUI

struct NotificationBtnView: View {
    
    //MARK: - PROPERTIES
    
    //MARK: - BODY
    var body: some View {
        
        Button(action: {
            //btn action
        }) {
            Image(.appImages(.ic_notification))
                .foregroundColor(.white)
                .padding(5)
                .background(
                Circle()
                    .fill(Color.custom(.primary))
                )
        }
    }
}

//MARK: - PREVIEW
struct NotificationBtnView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationBtnView()
    }
}
