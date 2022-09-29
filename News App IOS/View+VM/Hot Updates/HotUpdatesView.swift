//
//  HotUpdatesView.swift
//  News App IOS
//
//  Created by Achitha Sandaruwan on 2022-09-29.
//

import SwiftUI

struct HotUpdatesView: View {
    
    //MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentation
    
    //MARK: - BODY
    var body: some View {
        
        VStack {
            
            //navigation bar
            NavBarWithBackBtnView(title: "Hot Updates") {
                presentation.wrappedValue.dismiss()
            }
            .padding(.horizontal, 15)
            .padding(.top, 16)
            
            //content
            ScrollView(showsIndicators: false) {
                
                VStack {
                    
                    Text("Test Content")
                    
                }//VStack
                .padding(.horizontal, 15)
                
            }//Scroll
            
        }//VStack
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
    }
}

//MARK: - PREVIEW
struct HotUpdatesView_Previews: PreviewProvider {
    static var previews: some View {
        HotUpdatesView()
    }
}
