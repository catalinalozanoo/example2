//
//  example2App.swift
//  example2
//
//  Created by catalina lozano on 02/07/24.
//

import SwiftUI

@main
struct example2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentCView()
            //.environment(\.managedObjectContext, persistenceController.container.viewContext)
            
            
            /*
            ContentB()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
             */
           /*
            ContentView(question: Data(id: "", name: "", symbol: ""))
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            */
        }
    }
}
