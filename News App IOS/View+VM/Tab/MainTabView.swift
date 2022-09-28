//
//  MainTabView.swift
//  News App IOS
//
//  Created by Achitha Sandaruwan on 2022-09-28.
//

import SwiftUI

struct MainTabView: View {
    
    //MARK: PROPERTIES
    @State var selectedIndex = 0
    @State var tabsInfo : [TabInfo] = [
        TabInfo(id: 0, title: "Home", img: .appImages(.ic_home), isSelected: true),
        TabInfo(id: 1, title: "Favorite",img: .appImages(.ic_favourite), isSelected: false),
        TabInfo(id: 2, title: "Profile",img: .appImages(.ic_profile), isSelected: false)
    ]
    
    //MARK: BODY
    var body: some View {
        
        NavigationView {
            ZStack  {
                VStack(spacing: 0) {
                    switch selectedIndex{
                    case 0:
                        Text("Tab1")
                        
                    case 1:
                        Text("Tab2")
                        
                    default:
                        Text("Tab3")
                    }
                    Spacer(minLength: 0)
                }//VStack
                
                VStack(spacing: 0) {
                    Spacer(minLength: 0)
                    //TabBar
                    TabBarView(tabBarHeight: 43, selectedIndex: $selectedIndex, tabsInfo: $tabsInfo)
                        .padding(.bottom, 30)
                    
                }
                
            }//ZStack
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
