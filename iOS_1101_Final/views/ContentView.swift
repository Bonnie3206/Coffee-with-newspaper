//
//  ContentView.swift
//  iOS_1101_Final
//
//  Created by CK on 2021/12/1.
//

import SwiftUI
import Foundation


struct ContentView: View {
    
    var body: some View {
        TabView{
            CafeStoreView()
                .tabItem {
                    Label("咖啡店",systemImage:"house")
                }
//            SearchView()
//                .tabItem {
//                    Label("首頁",systemImage:"keyboard")
//                }
            NewsDataView()
                .tabItem {
                    Label("新聞",systemImage:"network")
                }
            CollectionView()
                .tabItem {
                    Label("最愛",systemImage:"heart.circle.fill")
                }
            
        }
    }
    
    
}

//struct ItemList: View {
//
//    @State private var items = [CafeStore]()
//
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach(items, id: \.self) { item in
//                    NavigationLink {
//                        ItemDetail(item: item)
//                    } label: {
//                        ItemRow(item: item)
//                    }
//                }
//        }
//        .onAppear {
//            fetchItems(term: "taipei")
//        }
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext,
                                  PersistenceController.preview.container.viewContext);ContentView().environment(\.managedObjectContext,
                                                                                      PersistenceController.preview.container.viewContext)
    }
}
