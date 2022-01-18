//
//  NewsData.swift
//  iOS_1101_Final
//
//  Created by CK on 2022/1/18.
//

import Foundation

struct NewsData: Codable,Hashable{
    
    var articles: [Aritcles]
    
    
}
struct Aritcles: Codable,Hashable{
    
    var title: String
    
    //let url: String
}
