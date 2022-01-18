//
//  CafeStoreViewModel.swift
//  iOS_1101_Final
//
//  Created by CK on 2022/1/17.
//

import Foundation

class CafeStoreViewModel: ObservableObject{
    
    init(){
        fetchItems(term: "tapei")
    }
    @Published var showAlert = false
    @Published var items = [CafeStore]()
    
    func fetchItems(term: String) {
        let urlString = "https://cafenomad.tw/api/v1.2/cafes/\(term)"
        //let urlStr = "https://itunes.apple.com/search?term=\(term)&media=music"
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, response , error in
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        decoder.dateDecodingStrategy = .iso8601
                        let searchResponse = try decoder.decode([CafeStore].self,
                                                                from: data)
                        //第一層是Array
                        print("Success")
                        
                        DispatchQueue.main.async{
                            self.items = searchResponse
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
