//
//  DataController.swift
//  example2
//
//  Created by catalina lozano on 02/07/24.
//

import Foundation
import UIKit
import SwiftUI
import CoreData

let urlString = "https://api.randomuser.me/"
let ENTITY_NAME = "Entity"

class DataController: ObservableObject {
    @Published var dataList: [Results] = []
    private let context: NSManagedObjectContext
    
    
    init() {
        context = UIApplication.shared.delegate! as! NSManagedObjectContext
        //readData()
    }
   /*
    func userDataToView(data: Data) -> Results {
          var addData = simpleDataList[0]
        
        do{
            let json = try JSONSerialization.jsonObject(with: data) as! NSDictionary
            
            if let resultsArray = json.object(forKey: "results") as? NSArray {
                let resultDictionary: NSDictionary = resultsArray[0] as! NSDictionary
               
                let email = (resultDictionary["email"] ?? "email") as! String
               
                addData.email = email
                createData(simepleData: addData)
            }
        }catch {
            fatalError(error.localizedDescription)
        }
        return addData
    }
    */
    func createData(simepleData: Results){
        let entity = NSEntityDescription.insertNewObject(forEntityName: ENTITY_NAME, into: context)
        entity.setValue(simepleData.email, forKeyPath: "email")
        
        do {
            try context.save()
            print("create data")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func readData(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: ENTITY_NAME)
        do {
            let fetch = try context.fetch(request)
            
            for data in fetch as! [NSManagedObject]{
                let simpleData = Results(email: data.value(forKey: "email") as! String)
                self.dataList.append(simpleData)
            }
            print("Read data success")
        } catch {
            print(error.localizedDescription)
        }
    }
    func deleteData(id: Int, index: IndexSet){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: ENTITY_NAME)
        do{
            let fetch = try context.fetch(request)
            for data in fetch as! [NSManagedObject]{
                if data.value(forKey: "id") as! Int == id {
                    context.delete(data)
                    try context.save()
                    self.dataList.remove(atOffsets: index)
                    print("Delete data success")
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
     
}
