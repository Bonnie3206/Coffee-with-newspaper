//
//  NewsDataModelView.swift
//  iOS_1101_Final
//
//  Created by CK on 2022/1/18.
//

import Foundation

class NewsDataViewModel: ObservableObject{
    
    init(){
        fetchItems(term: "tapei")
    }
    @Published var showAlert = false
    @Published var items = [Aritcles]()
    
    func fetchItems(term: String) {
        let urlString = "https://newsapi.org/v2/top-headlines?country=tw&apiKey=ff178e0f80a34c8da6ad52166a2b73ee"
        
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, response , error in
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        decoder.dateDecodingStrategy = .iso8601
                        let searchResponse = try decoder.decode(NewsData.self,
                                                                from: data)
                        //第一層是Array
                        print("Success")
                        
                        DispatchQueue.main.async{
                            self.items = searchResponse.articles
                            self.showAlert = false
                        }
                        
                    } catch {
                        print(error)
                        self.showAlert = true
                    }
                }
            }.resume()
            
        }
    }
    
}
