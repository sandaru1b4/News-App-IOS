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
    var imgUrlString: String
    var name: String
    var description: String
    var subDescription: String
    
    //MARK: - BODY
    var body: some View {
        
        VStack {
            
            //image
            WebImage(url: URL(string: imgUrlString ))
                .resizable()
                .placeholder {
                    Rectangle().foregroundColor(Color.custom(._E0E0E0))
                }
                .indicator {_,_ in
                    ProgressView()
                }
                .scaledToFill()
                .frame(width: 321 ,height: 240, alignment: .center)
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
                            Text(name)
                                .font(.customFont(.NunitoExtraBold, 10))
                            
                            Text(description)
                                .font(.customFont(.NewYorkBold, 16))
                        }
                        .padding(.bottom, 40)
                        
                        Text(subDescription)
                            .font(.customFont(.NunitoRegular, 10))
                        
                        
                    }//VStack
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
        LatestNewsCardView(imgUrlString: "https://picsum.photos/seed/picsum/200/300", name: "By Test", description: "Crypto investors should be prepared to lose all their money, BOE governor says", subDescription: "I’m going to say this very bluntly again,” he added. “Buy them only if you’re prepared to lose all your money.")
    }
}
