//
//  NewsDataView.swift
//  iOS_1101_Final
//
//  Created by CK on 2022/1/18.
//

import SwiftUI

struct NewsDataView: View {
    @State var showAlert = false
    @StateObject var newsDataViewModel = NewsDataViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(newsDataViewModel.items, id: \.self) { item in
                    NavigationLink(
                        destination: NewsItemDetail(item: item),
                        label:{
                            NewsItemRow(item: item)
                        }
                    )
                }
            }.overlay (
                Button(action: {
                    showAlert = newsDataViewModel.showAlert
                    newsDataViewModel.fetchItems(term: "")
                    
                }, label: {
                    if newsDataViewModel.items.isEmpty{
                        VStack{
                            
                            ProgressView()
                            Text("重新整理")
                        }
                        
                    }
                }).alert(isPresented:$showAlert ) { () -> Alert in
                    
                    return Alert(title: Text("發生錯誤"), message: Text(" "), dismissButton: .default(Text("確定"), action: {
                     }))
                 }
                
            )
        }.onAppear{
            showAlert = newsDataViewModel.showAlert
        }
    }
}
struct NewsItemRow: View {
    
    let item: Aritcles
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.title)
                .bold()
        }
    }
}
struct NewsItemDetail: View {
    
    let item: Aritcles
    var body: some View {
        VStack(alignment: .leading) {
            Text("name")
            Text(item.title)
                .bold()
        }
    }
}

struct NewsDataView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDataView()
    }
}
