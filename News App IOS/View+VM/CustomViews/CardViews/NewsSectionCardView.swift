//
//  NewsSectionCardView.swift
//  News App IOS
//
//  Created by Achitha Sandaruwan on 2022-09-28.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsSectionCardView: View {
    
    //MARK: - PROPERTIS
    var imgUrlString: String
    var title: String
    var name: String
    var date: String
    
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
                .frame(height: 128, alignment: .center)
                .cornerRadius(8)
                .clipped()
                .overlay(
                    
                    RoundedRectangle(cornerRadius: 8)
                        .fill(
                            LinearGradient(colors: [Color.black, Color.black.opacity(0.5), Color.clear], startPoint: .bottom, endPoint: .top)
                        )
                    
                )
                .overlay(
                    //content texts
                    VStack(alignment: .leading) {
                        
                        
                        Text(title)
                        
                      Spacer()
                        HStack {
                            
                            Text(name)
                            
                            Spacer()
                            
                            Text(date)
                        }
                        
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
struct NewsSectionCardView_Previews: PreviewProvider {
    static var previews: some View {
        NewsSectionCardView(imgUrlString: "", title: "Test", name: "Test", date: "Test")
    }
}
