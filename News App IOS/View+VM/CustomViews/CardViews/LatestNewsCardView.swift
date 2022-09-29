//
//  LatestNewsCardView.swift
//  News App IOS
//
//  Created by Achitha Sandaruwan on 2022-09-28.
//

import SwiftUI
import SDWebImageSwiftUI

struct LatestNewsCardView: View {
    
    //MARK: - PROPERTIS
    var article: Article?
    
    //MARK: - BODY
    var body: some View {
        
        VStack {
            
            //image
            WebImage(url: URL(string: article?.urlToImage ?? "" ))
                .resizable()
                .placeholder {
                    Rectangle().foregroundColor(Color.custom(._E0E0E0))
                }
                .indicator {_,_ in
                    ProgressView()
                }
                .frame(width: 321, height: 240, alignment: .center)
                .aspectRatio(contentMode: .fill)
                .cornerRadius(8)
                .clipped()
                .overlay(

                    RoundedRectangle(cornerRadius: 8)
                        .fill(
                            LinearGradient(colors: [Color.black, Color.black.opacity(0.69), Color.clear], startPoint: .bottom, endPoint: .top)
                        )

                )
                .overlay(
                    //content texts
                    VStack(alignment: .leading) {
                        
                        VStack(alignment: .leading, spacing: 5){
                            Text("By \(article?.author ?? "")")
                                .font(.customFont(.NunitoExtraBold, 10))
                            
                            Text(article?.articleDescription ?? "")
                                .font(.customFont(.NewYorkBold, 16))
                        }
                        .padding(.bottom, 40)
                        
                        Text(article?.content ?? "")
                            .font(.customFont(.NunitoRegular, 10))
                        
                        
                    }//VStack
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .padding(16)
                    ,
                    alignment: .bottom
                    
                )
            
            
        }//VStack
        
    }
}


//MARK: - PREVIEW
struct LatestNewsCardView_Previews: PreviewProvider {
    static var previews: some View {
        LatestNewsCardView()
    }
}
