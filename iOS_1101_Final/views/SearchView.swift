//
//  SearchView.swift
//  iOS_1101_Final
//
//  Created by CK on 2022/1/18.
//

import SwiftUI
import SPAlert

struct SearchView: View {
    
    @State var showAlert = false
    
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Button("Show alert") {
                showAlert = true
            }.SPAlert(isPresent: $showAlert, message: "this is message only")
        }
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
