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
                        
                        
                        Text(article?.title ?? "No Title")
                            .multilineTextAlignment(.leading)
                        
                      Spacer()
                        HStack {
                            
                            Text(article?.author ?? "No Author")
                                .lineLimit(1)
                            
                            Spacer()
                            
                            Text(dateSelected)
                        }
                        
                    }//VStack
                        .foregroundColor(.white)
                        .padding(16)
                    ,
                    alignment: .bottom
                    
                )
            
            
        }//VStack
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
struct NewsSectionCardView_Previews: PreviewProvider {
    static var previews: some View {
        NewsSectionCardView()
    }
}
