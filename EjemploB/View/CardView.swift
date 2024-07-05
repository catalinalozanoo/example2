//
//  CardView.swift
//  example2
//
//  Created by catalina lozano on 02/07/24.
//

import SwiftUI

struct CardView: View {
    var video: VideosModel
   // var datas: [Datas]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
           /* Text(datas[0].name)
                  .font(.system(size: 15))
                  .fontWeight(.heavy)
                  .foregroundColor(.black)*/
     
           Text(video.title)
                .font(.system(size: 15))
                .fontWeight(.heavy)
                .foregroundColor(.black)
            
            Text(String(video.completed))
                .font(.system(size: 12))
                .fontWeight(.heavy)
                .foregroundColor(.black)
           
            
        }
    }
}


