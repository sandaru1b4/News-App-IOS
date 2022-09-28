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
                                print("button tap")
                                //
                            }) {
                                HStack(spacing: 28) {
                                    Text("See All")
                                    
                                    Image(systemName: "arrow.right")
                                }
                            }
                        }
                        .padding(.horizontal, 15)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            
                            HStack(spacing: 8) {
                                ForEach(0..<10) { _ in
                                    
                                    LatestNewsCardView(imgUrlString: "https://picsum.photos/seed/picsum/200/300", name: "By Test", description: "Crypto investors should be prepared to lose all their money, BOE governor says", subDescription: "I’m going to say this very bluntly again,” he added. “Buy them only if you’re prepared to lose all your money.")
                                }
                            }//HStack
                            .padding(.leading, 15)
                        }
                    }//VStack
                }
                
                
                //Category sections
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 8) {
                        ForEach(vm.categoryInfo, id: \.id) { section in
                            SectionBtnView(title: section.title, isSelected:  vm.selectedSectionId == section.id) {
                                //api call
                                vm.selectedSectionId = section.id
                                
                            }
                        }
                    }
                    .padding(.leading, 15)
                    
                }
                .padding(.top, 24)
                .padding(.bottom, 16)
                
                
                //News List
                ScrollView(showsIndicators: false) {
                    
                    LazyVStack(spacing: 8) {
                        ForEach(vm.newsList,  id: \.title) { article in
                            NewsSectionCardView(article: article)
                        }
                    }//LazyVStack
                    .padding(.horizontal, 15)
                    
                }//Vertical Scroll
            }//Vertical Scroll
            
        }//VStack
        .onAppear {
            getNewsList()
        }
        .alert(isPresented: $vm.showAlert, content: {
            Alert(title: Text(vm.alertTitle), message: Text(vm.alertMessage), dismissButton: .default(Text("Ok"), action: {} ))
        })
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        
    }
    
    //MARK: - FUNCTIONS
    
  private func getNewsList() {
      startLoading()
      vm.getNewsList { status, code, message in
          stopLoading()
          if status {
              
          } else {

          }
      }
      
    }
    
    
}


//MARK: - PREVIEW
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
