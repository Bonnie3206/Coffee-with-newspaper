//
//  CafeStoreDetailView.swift
//  iOS_1101_
//
//  Created by CK on 2021/12/29.
//

import SwiftUI

struct CafeStoreView: View {
    init(){
        cafeStoreViewModel.fetchItems(term: "tapei")
    }
    @State var showAlert = false
    @StateObject var cafeStoreViewModel = CafeStoreViewModel()
   // @StateObject var showAlert = CafeStoreViewModel().showAlert
    

        var body: some View {
            
            NavigationView {
                VStack{
                    
                    List {
                        ForEach(cafeStoreViewModel.items, id: \.self) { item in
                            NavigationLink(
                                destination: ItemDetail(item: item),
                                label:{
                                    ItemRow(item: item)
                                }
                            )
                        }
                    }.overlay(
                        ProgressView()
                             .opacity(cafeStoreViewModel.items.isEmpty ? 1 : 0)
                  )
                    Button(action: {
                        showAlert = cafeStoreViewModel.showAlert
                        cafeStoreViewModel.fetchItems(term: "taipei")
                        
                    }, label: {
                        Text("重新整理")
                    }).alert(isPresented:$showAlert ) { () -> Alert in
                        
                        return Alert(title: Text("發生錯誤"), message: Text(" "), dismissButton: .default(Text("確定"), action: {
                            //showThirdView = true
                         }))
                     }
                }
            }.onAppear{
                showAlert = cafeStoreViewModel.showAlert
                cafeStoreViewModel.fetchItems(term: "tapei")
            }
        }
    }
struct IfProgressView: View {
    @StateObject var cafeStoreViewModel = CafeStoreViewModel()
    var body: some View{
        if cafeStoreViewModel.items.isEmpty{
            ProgressView()
        }
    }
    
    
}
struct ItemRow: View {
    
    let item: CafeStore
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.name)
                .bold()
        }
    }
}
struct ItemDetail: View {
    
    let item: CafeStore
    var body: some View {
        VStack(alignment: .leading) {
            Text("name")
            Text(item.name)
                .bold()
            Text(item.address ?? "nil")
                .bold()
        }
    }
}
struct CafeStoreDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CafeStoreView()
    }
}
