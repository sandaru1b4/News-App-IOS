//
//  HomeSearchBarView.swift
//  News App IOS
//
//  Created by Achitha Sandaruwan on 2022-09-28.
//

import SwiftUI

struct HomeSearchBarView: View {
    
    //MARK: - PROPERTIES
    @Binding var searchText: String
    var placeholder: String
    
    //MARK: - BODY
    var body: some View {
        
        HStack {
            TextField(placeholder, text: $searchText)
                .font(.customFont(.NunitoSemiBold, 12))
                .autocorrectionDisabled(true)
                .autocapitalization(.none)
            
            Image(.appImages(.ic_search))
                .foregroundColor(Color.custom(._E0E0E0))
        }//HStack
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(.white)
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.custom(._E0E0E0))
            }//ZStack
        )
        
    }
}


//MARK: - PREVIEW
struct HomeSearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        HomeSearchBarView(searchText: .constant(""), placeholder: "Dogecoin to the Moon...")
    }
}
