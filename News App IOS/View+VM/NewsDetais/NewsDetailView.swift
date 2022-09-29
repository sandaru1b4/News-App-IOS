//
//  NewsDetailView.swift
//  News App IOS
//
//  Created by Achitha Sandaruwan on 2022-09-29.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsDetailView: View {
    
    //MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentation
    var article: Article?
    
    
    //MARK: - BODY
    var body: some View {
        
        
        VStack {
            
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 0) {
                    WebImage(url: URL(string: article?.urlToImage ?? "" ))
                        .resizable()
                        .placeholder {
                            Rectangle().foregroundColor(Color.custom(._E0E0E0))
                        }
                        .indicator {_,_ in
                            ProgressView()
                        }
                        .frame(height: 400, alignment: .center)
                        .aspectRatio(contentMode: .fill)
                    
                    
                    VStack {
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 30)
                                .fill(.white)
                        }
                        
                    }
                    .frame(minHeight: 350)
                    .customCornerRadius(radius: 30, corners: [.topLeft, .topRight])
                    .clipped()
                    .offset(y: -30)
                    .overlay(
                    
                        ZStack {
                            
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.custom(._F5F5F5).opacity(0.7))
                            
                            VStack(alignment: .leading, spacing: 8) {
                                
                                Text("Sunday, 9 May 2021")
                                    .font(.customFont(.NunitoSemiBold, 12))
                                
                                Text("Crypto investors should be prepared to lose all their money, BOE governor says")
                                    .font(.customFont(.NewYorkBold, 16))
                                
                                Text("Published by Ryan Browne")
                                    .font(.customFont(.NunitoExtraBold, 10))
                            }
                            .padding(.vertical, 16)
                            .padding(.horizontal, 24)
                            .foregroundColor(.custom(.TabBarSelectTxtClr))
                            
                            
                        }
                            .frame(height: 141)
                            .padding(.horizontal, 32)
                            .offset(y: -100)
                        ,
                        alignment: .top
                        
                    
                    )
                    
                    
                }//VStack
                
                
            }//Scroll
            .ignoresSafeArea()
            
        }//VStack
        .overlay(
        
            //back button
            NavBarWithBackBtnView(title: "") {
                //
                presentation.wrappedValue.dismiss()
            }
            .padding(.top, 16)
            .padding(.leading, 15),
            alignment: .topLeading
        
        
        )
        .overlay(
        
            //floating button
            FloatingBtnView()
                .padding(.bottom, 50)
                .padding(.trailing, 15),
            alignment: .bottomTrailing
        
        )
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        
    }
}

//MARK: - PREVIEW
struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailView()
    }
}
