//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Dilshad P on 01/12/24.
//

import SwiftUI

@main
struct BookwormApp: App {
    
    @StateObject var  dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext,dataController.container.viewContext)
        }
    }
}
