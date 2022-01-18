//
//  iOS_1101_FinalApp.swift
//  iOS_1101_Final
//
//  Created by CK on 2021/12/1.
//

import SwiftUI
import CoreData

 
@main
struct iOS_1101_FinalApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext,
                persistenceController.container.viewContext)
        }
    }
}
