//
//  HomeView.swift
//  News App IOS
//
//  Created by Achitha Sandaruwan on 2022-09-28.
//

import SwiftUI

struct HomeView: View {
    
    //MARK: - PROPERTIES
    @StateObject var vm = HomeVM()
    
    //MARK: - BODY
    var body: some View {
        
        ZStack {
            
            VStack(spacing: 0) {
                
                //Top Bar
                HStack(spacing: 16) {
                    HomeSearchBarView(searchText: $vm.searchText, placeholder: "Dogecoin to the Moon...")
                    
                    NotificationBtnView()
                    
                }
                .padding(.top, 16)
                .padding(.bottom, 24)
                .padding(.horizontal, 15)
                
                
                ScrollView(showsIndicators: false) {
                    //latest news Section
                    Group {
                        VStack(spacing: 16) {
                            HStack(spacing: 0) {
                                Text("Latest News")
                                    .font(.customFont(.NewYorkSemibold, 18))
                                
                                Spacer()
                                //see all button
                                Button(action: {
                                    //
                                }) {
                                    HStack(spacing: 28) {
                                        Text("See All")
                                        
                                        Image(systemName: "arrow.right")
                                    }
                                }
                            }
                            
                            LatestNewsCardView(imgUrlString: "https://picsum.photos/seed/picsum/200/300", name: "By Test", description: "Crypto investors should be prepared to lose all their money, BOE governor says", subDescription: "I’m going to say this very bluntly again,” he added. “Buy them only if you’re prepared to lose all your money.")
                        }//VStack
                    }
                    .padding(.horizontal, 15)
                    
                    //sections
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack(spacing: 8) {
                            ForEach(0..<10) { _ in
                                SectionBtnView(title: "Title", isSelected: true) {
                                    //api call
                                }
                            }
                        }
                        .padding(.leading, 15)
                        
                    }
                    .padding(.top, 24)
                    
                    
                    LazyVStack {
                        
                    }//VStack
                    
                    
                }
                
            }//VStack
            
        }//ZStack
        
    }
}


//MARK: - PREVIEW
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
