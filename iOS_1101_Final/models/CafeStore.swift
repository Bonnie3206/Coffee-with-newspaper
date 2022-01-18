//
//  CafeStore.swift
//  iOS_1101_Final
//
//  Created by CK on 2021/12/28.
//

import Foundation

struct CafeStore: Codable,Identifiable,Hashable {
    
    
    var id: String
    var name: String
    var city: String
    var wifi: Double?
    var seat: Double?
    var quiet: Double?
    var tasty: Double?
    var cheap: Double?
    var music: Double?
    var url: String?
    var address: String?
    var latitude: String?
    var longitude: String?
    var limited_time: String?
    var socket: String?
    var standing_desk: String?
    var mrt: String?
    var open_time: String?
}
struct SearchResponse:Codable {
    
    let results:[CafeStore]
}
enum city: String {
    case taipei
    case hsinchu
    case kaohsiung
}

