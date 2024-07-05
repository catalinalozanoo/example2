//
//  VideosModel.swift
//  example2
//
//  Created by catalina lozano on 02/07/24.
//

import Foundation

struct VideosModel: Decodable, Hashable {
    var title: String
    var completed: Bool
}



struct Coins: Codable {
    let data: [Datas]
}

struct Datas: Codable, Hashable {
   // var id: String
    let name: String
    //let symbol: Bool
}

//}, Identifiable {
