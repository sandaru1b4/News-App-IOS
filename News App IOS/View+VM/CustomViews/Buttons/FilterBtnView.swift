//
//  FilterBtnView.swift
//  News App IOS
//
//  Created by Achitha Sandaruwan on 2022-09-28.
//

import SwiftUI

struct FilterBtnView: View {
    
    //MARK: - PROPERTIES
    
    //MARK: - BODY
    var body: some View {
        
        HStack(spacing: 4) {
            Image(.appImages(.ic_filter))
                .resizable()
                .scaledToFit()
                .frame(height: 14)
            
            Text("Filter")
                .font(.customFont(.NunitoBlack, 12))
                .foregroundColor(.white)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 8)
        .background(
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.custom(.primary))
        )
    }
}


//MARK: - PREVIEW
struct FilterBtnView_Previews: PreviewProvider {
    static var previews: some View {
        FilterBtnView()
    }
}
