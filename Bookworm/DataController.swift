//
//  DataController.swift
//  Bookworm
//
//  Created by Dilshad P on 01/12/24.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    
    let container = NSPersistentContainer(name: "Bookworm")
    
    init(){
        container.loadPersistentStores {description, error in
            
            if let error = error {
                print("Error to load coredata \(error.localizedDescription)")
            }
            
        }
    }
}
