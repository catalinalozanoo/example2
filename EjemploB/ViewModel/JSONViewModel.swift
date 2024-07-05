//
//  JSONViewModel.swift
//  example2
//
//  Created by catalina lozano on 02/07/24.
//

import Foundation
import UIKit
import SwiftUI
import CoreData

class JSONViewModel: ObservableObject {
    
    @Published var videoss: [VideosModel] = []
    @Published var datas:[Datas] = []
    @Published var coins = Coins(data: [Datas(name: "")])
    //Coins(data: ([Datas(name: "", symbol: true)]))
    
    //8:09 https://www.youtube.com/watch?v=mlHnCz3Pjzs
    //saving JsonTo Core Data
    func saveData(context: NSManagedObjectContext){
        videoss.forEach { data in
            let entity = Videos(context: context)
            entity.completed = data.completed
            entity.title = data.title
        }
        //saving all pending data at once..
        do{
            try context.save()
            print("data saved")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
   
        func performAPICall() {
            let urls = "https://api.coincap.io/v2/assets"
            /*let (data, _) = try await URLSession.shared.data(from: url)
            let wrppers = try JSONDecoder().decode(Coins.self, from: data)
            return wrppers.data[0]*/
          
            var request = URLRequest(url: URL(string: urls)!)
            request.addValue("swiftui2.0", forHTTPHeaderField: "field")
            
            let session = URLSession(configuration: .default)
            session.dataTask(with: request) { data, res, _ in
                guard let jsonData = data else {return}
                let response = res as! HTTPURLResponse
                
                if response.statusCode == 404 {
                    print("error api error")
                    return
                }
                do {
                    let videos = try JSONDecoder().decode(Coins.self, from: jsonData)
                    
                    DispatchQueue.main.async {
                        self.coins = videos
                        videos.data[0]
                        print(self.coins)
                        //print(self.coins.data[0].name)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
            .resume()
        }
      
    func fetchData(context: NSManagedObjectContext){
        let url = "https://jsonplaceholder.typicode.com/todos"
        
        var request = URLRequest(url: URL(string: url)!)
        request.addValue("swiftui2.0", forHTTPHeaderField: "field")
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: request) { data, res, _ in
            guard let jsonData = data else {return}
            let response = res as! HTTPURLResponse
            
            if response.statusCode == 404 {
                print("error api error")
                return
            }
            do {
                let videos = try JSONDecoder().decode([VideosModel].self, from: jsonData)
                DispatchQueue.main.async {
                    self.videoss = videos
                    self.saveData(context: context)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        .resume()
    }
}
