//
//  ContentView.swift
//  example2
//
//  Created by catalina lozano on 02/07/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var question: Data
   // @ObservedObject var question: Data

    var body: some View {
        VStack(alignment: .leading){
            List {
              //  ForEach(question, id: \.id) { q in
                    Text(question.name)
                        .font(.title)
                    Text(question.symbol)
                        .font(.title)
                    /*  if let question {
                     Text(question.name)
                     .font(.title)
                     Text(question.symbol)
                     .font(.title)
                     //Text("Score" + question.score.formatted())
                     } else {
                     Text("No data available")
                     }*/
            }
            
        }.padding(20.0)
            .task {
                do {
                    question = try await performAPICall()
                } catch {
                    print("Error")
                }
            }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(question: Data.init(id: "", name: "", symbol: ""))
    }
}
