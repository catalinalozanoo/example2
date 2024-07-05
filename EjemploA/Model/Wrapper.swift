//
//  Wrapper.swift
//  example2
//
//  Created by catalina lozano on 02/07/24.
//

import Foundation
import UIKit
import SwiftUI

struct Wrapper: Codable {
    let items: [Question]
}

struct Question: Codable {
    let score: Int
    let title: String
}

struct Wmain: Codable {
    let data: [Data]
}

struct Data: Codable, Identifiable {
    var id: String
    let name: String
    let symbol: String
}

func performAPICall() async throws -> Data {
   // let url = URL(string: "https://api.stackexchange.com/2.3/questions?pagesize=1&order=desc&sort=votes&site=stackoverflow&filter=)pe0bT2YUo)Qn0m64ED*6Equ")!
    let url = URL(string: "https://api.coincap.io/v2/assets")!
    let (data, _) = try await URLSession.shared.data(from: url)
    let wrapper = try JSONDecoder().decode(Wmain.self, from: data)
    return wrapper.data[0]
}

/*
Task {
    try await performAPICall()
}
 */

