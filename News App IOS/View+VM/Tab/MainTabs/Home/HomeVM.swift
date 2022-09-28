//
//  HomeVM.swift
//  News App IOS
//
//  Created by Achitha Sandaruwan on 2022-09-28.
//

import UIKit
import Combine


class HomeVM: ObservableObject {
    
    //MARK: - PROPERTIES
    @Published var showAlert = false
    @Published var alertMessage = ""
    @Published var alertTitle = ""
    
    @Published var searchText = ""
    @Published var newsList: [Article] = []
    @Published var categoryInfo: [CategorySection] = [
    CategorySection(id: 0, title: "Healthy"),
    CategorySection(id: 1, title: "Technology"),
    CategorySection(id: 2, title: "Finance"),
    CategorySection(id: 3, title: "Arts")
    ]
    @Published var selectedSectionId = 0
    
    var baseUrl = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2022-08-28&sortBy=publishedAt&apiKey=a444ab036df1456090131cbb7786eda2")
    
    typealias Completionhandeler = (_ status: Bool, _ code: Int, _ message: String) -> ()
    
    private var disposeBag = Set<AnyCancellable>()
    
    init() {
        self.debounceTextChanges()
    }
    
}


extension HomeVM {
    
    func getNewsList(q: String? = nil ,completion: @escaping Completionhandeler) {
        
        if searchText != "" {
            URLSession.shared.request(url: URL(string: "https://newsapi.org/v2/everything?q=\(searchText)&from=2022-08-28&sortBy=publishedAt&apiKey=a444ab036df1456090131cbb7786eda2"),
                                      expecting: Payload.self) { result in
                switch result {
                    
                case .success(let payload):
                    
                    guard let newsList = payload.articles else {
                        completion(false, 400, "no data")
                        return
                    }
                    DispatchQueue.main.async {
                        self.newsList = newsList
                    }
                    
                    print(self.newsList)
                    completion(true, 200, "Success")
                    
                case .failure(let error):
                    
                    completion(false, 400, error.localizedDescription)
                    self.showAlert = true
                    self.alertTitle = "error"
                    self.alertMessage = error.localizedDescription
                }
            }
        } else {
            URLSession.shared.request(url:baseUrl,
                                      expecting: Payload.self) { result in
                switch result {
                    
                case .success(let payload):
                    
                    guard let newsList = payload.articles else {
                        completion(false, 400, "no data")
                        return
                    }
                    DispatchQueue.main.async {
                        self.newsList = newsList
                    }
                    
                    print(self.newsList)
                    completion(true, 200, "Success")
                    
                case .failure(let error):
                    
                    completion(false, 400, error.localizedDescription)
                    self.showAlert = true
                    self.alertTitle = "error"
                    self.alertMessage = error.localizedDescription
                }
            }
        }
        
    }
    
    
    //search
    private func debounceTextChanges() {
        $searchText
        // 1 second debounce
            .debounce(for: 1, scheduler: RunLoop.main)
            .dropFirst()
        // Called after 1 seconds when text stops updating (stoped typing)
            .sink { [self]_ in
                
                self.newsList.removeAll()
                
                self.getNewsList { status, code, message in
                   //handle response
                }
                
            }
            .store(in: &disposeBag)
    }
    
}
