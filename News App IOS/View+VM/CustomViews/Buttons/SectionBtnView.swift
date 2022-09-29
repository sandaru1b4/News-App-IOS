//
//  SectionBtnView.swift
//  News App IOS
//
//  Created by Achitha Sandaruwan on 2022-09-28.
//

import SwiftUI

struct SectionBtnView: View {
    
    //MARK: - PROPETIES
    var title: String
    var isSelected: Bool
    var action: (()->())?
    
    //MARK: - BODY
    var body: some View {
        
        
        Button(action:
                {
            action?()
            
        }) {
            Text(title)
                .font(.customFont(.NunitoBlack, 12))
                .foregroundColor(isSelected ? .white : Color.custom(.TabBarSelectTxtClr))
                .padding(.vertical, 6)
                .padding(.horizontal, 15)
                .background(
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(isSelected ? Color.custom(.primary) : Color.white)
                        
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(isSelected ? Color.custom(.primary).opacity(0.5) : Color.custom(._E0E0E0).opacity(0.8))
                        
                    }
                    
                )
        }//Btn
    }
}

//MARK: - PREVIEW
struct SectionBtnView_Previews: PreviewProvider {
    static var previews: some View {
        SectionBtnView(title: "Healthy", isSelected: true)
    }
}
