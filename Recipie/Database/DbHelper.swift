//
//  DbHelper.swift
//  Recipie
//
//  Created by Pedro Lenzi on 01/11/20.
//  Copyright © 2020 Pedro Lenzi. All rights reserved.
//

import Foundation
import CoreData

class DbHelper {
    static var sharedInstance = { return DbHelper() }()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Automata")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
//    func fetchAutomata() -> [Automaton] {
//        let result = try! persistentContainer.viewContext.fetch(NSFetchRequest(entityName: "AutomatonMO")) as! [AutomatonMO]
//
//        var automata = [Automaton]()
//        for managedObject in result {
//            automata.append(Automaton(managedObject))
//        }
//
//        return automata
//    }
//
//    func createAutomaton() {
//        let automatonMO = AutomatonMO()
//        automatonMO.name = UUID().uuidString
//        persistentContainer.viewContext.insert(automatonMO)
//    }
}
