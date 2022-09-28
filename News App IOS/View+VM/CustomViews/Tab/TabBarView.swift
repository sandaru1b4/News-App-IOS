//
//  TabBarView.swift
//  News App IOS
//
//  Created by Achitha Sandaruwan on 2022-09-28.
//

import SwiftUI

struct TabBarView: View {
    
    //MARK: - PROPERTIES
    var tabBarHeight : CGFloat
    
    @Binding var selectedIndex : Int
    @Binding var tabsInfo : [TabInfo]
    
    
    //MARK: - BODY
    var body: some View {
        
        ZStack(alignment: .top) {
            
            RoundedRectangle(cornerRadius: 32)
                .fill(Color.white)
                .ignoresSafeArea(edges: .bottom)
                .shadow(color: Color.black.opacity(0.08), radius: 25, x: 0, y: -7)
            
            HStack(spacing: 0){
                ForEach(tabsInfo, id: \.id){ tab in
                    Spacer(minLength: 0)
                    Button(action: {
                        selectedIndex = tab.id
                        tabsInfo[tab.id].isSelected = true
                        
                        //inactive & active action
                        for tabIn in tabsInfo {
                            if tab.id != tabIn.id{
                                tabsInfo[tabIn.id].isSelected = false
                            }
                        }
                        
                    }, label: {
                        VStack(alignment: .center, spacing: 8){
                            
                            if tab.isSelected{
                                
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.custom(._E0E0E0))
                                    .frame(width: 32, height: 4)
                                
                                Image(tab.img)
                                    .resizable()
                                    .foregroundColor(.custom(.primary))
                                    .scaledToFit()
                                    .frame(height: 24, alignment: .top)
                                
                                Text(tab.title)
                                    .font(.customFont(.NunitoRegular, 10))
                                    .foregroundColor(Color.custom(.TabBarSelectTxtClr))
                                
                            } else {
                                
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.clear)
                                    .frame(width: 32, height: 4)
                                
                                Image(tab.img)
                                    .resizable()
                                    .foregroundColor(Color.custom(.tabBarDeselectTxtClr))
                                    .scaledToFit()
                                    .frame(height: 24, alignment: .top)
                                
                                Text(tab.title)
                                    .font(.customFont(.NunitoRegular, 10))
                                    .foregroundColor(Color.custom(.tabBarDeselectTxtClr))
                            }
                            
                        }//VStack
                        .frame(width: Screen.sizeFromWidth(size: 60), height: 50, alignment: .top)
                        .padding(.top, 2)
                    })//Button
                    Spacer(minLength: 0)
                }//Repeat
            }//HStack
        }//ZStack
        .frame(width: Screen.sizeFromWidth(size: 289), height:  66)
    }
}

