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
                    
                    
                    VStack(alignment: .leading) {
                        
                        ZStack {
                            //background
                            RoundedRectangle(cornerRadius: 30)
                                .fill(.white)
                            
                            //content
                            VStack {
                                
                                Text(article?.content ?? " No Content")
                                
                            }
                            .padding(.horizontal, 15)
                        }
                        
                    }//VSTack
                    .frame(minHeight: 350)
                    .customCornerRadius(radius: 30, corners: [.topLeft, .topRight])
                    .clipped()
                    .offset(y: -30)
                    .overlay(
                        
                        ZStack {
                            
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.custom(._F5F5F5).opacity(0.7))
                            
                            VStack(alignment: .leading, spacing: 8) {
                                
                                Text(dateSelected)
                                    .font(.customFont(.NunitoSemiBold, 12))
                                
                                Text(article?.articleDescription ?? "No Description")
                                    .font(.customFont(.NewYorkBold, 16))
                                
                                Text("Published by \(article?.author ?? "Anonymous")")
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
            NavigationLink(destination: HotUpdatesView()) {
                FloatingBtnView()
            }
                .padding(.bottom, 50)
                .padding(.trailing, 15),
            alignment: .bottomTrailing
            
        )
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        
    }
    
    
    //show selected date text
    var dateSelected: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM y"
        dateFormatter.locale = Locale.current
        let dateString = dateFormatter.string(from: publishedDate(dateString: article?.publishedAt ?? ""))
        
        let weekDay = Calendar.current.component(.weekday, from: publishedDate(dateString: article?.publishedAt ?? ""))
        switch weekDay {
        case 1:
            return "Sunday, \(dateString)"
        case 2:
            return "Monday, \(dateString)"
        case 3:
            return "Tuesday, \(dateString)"
        case 4:
            return "Wednesday, \(dateString)"
        case 5:
            return "Thursday, \(dateString)"
        case 6:
            return "Friday, \(dateString)"
        case 7:
            return "Saturday, \(dateString)"
        default:
            print("Error fetching days")
            return "Day"
        }
    }
    
    
    //convert string date to Date()
    func publishedDate(dateString: String) -> Date {
        let isoDate = dateString
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from:isoDate)!
        
        return date
    }
    
}

//MARK: - PREVIEW
struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailView()
    }
}
