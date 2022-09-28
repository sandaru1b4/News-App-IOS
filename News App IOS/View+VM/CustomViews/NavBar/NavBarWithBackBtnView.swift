//
//  NavBarWithBackBtn.swift
//  News App IOS
//
//  Created by Achitha Sandaruwan on 2022-09-28.
//

import SwiftUI

struct NavBarWithBackBtnView: View {
    
    //MARK: - PROPERTIES
    var title: String
    var backBtnAction: (()->())?
    
    //MARK: - BODY
    var body: some View {
        
        HStack {
            //back button
            Button(action: {
                backBtnAction?()
            }) {
                
                Image(.appImages(.ic_back))
                    .resizable()
                    .frame(width: 34, height: 34)
                    .padding(1)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.custom(._F5F5F5).opacity(0.5))
                    )
                
            }
            
            Spacer()
        }//HStack
        .overlay(
            
            //title
            Text(title)
                .tracking(-0.41)
                .font(.customFont(.NewYorkSemibold, 17))
                .foregroundColor(Color.custom(.primary))
        
        )
    }
}

struct NavBarWithBackBtnView_Previews: PreviewProvider {
    static var previews: some View {
        NavBarWithBackBtnView(title: "Hot Updates")
    }
}
