//
//  Homes.swift
//  example2
//
//  Created by catalina lozano on 02/07/24.
//

import SwiftUI

struct Homes: View {
    @StateObject var jsonModel = JSONViewModel()
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        VStack {
            
            //jsonModel.datas.isEmpty{
            
            if jsonModel.videoss.isEmpty {
                ProgressView()
                    .onAppear(perform: {
                        jsonModel.fetchData(context: context)
                        //jsonModel.performAPICall()
                    })
                
            } else {
               List(jsonModel.videoss, id: \.self){ vid in
                    CardView(video: vid)
                }
              /* List(jsonModel.datas, id: \.self){ dt in
                   CardView(datas: [dt])
                     // CardView(datas: Datas(name: ""))
                  }*/
                .listStyle(InsetGroupedListStyle())
            }
        }
        .navigationTitle("Fetched JSON")
        .navigationBarTitleDisplayMode(.inline)
        //refreshButton...
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    //by clearing array data
                    //it will auto fetch all data again
                    jsonModel.videoss.removeAll()
                } label: {
                    Image(systemName: "arrow.clockwise.circle")
                        .font(.title)
                }

            }
        }
    }
}


