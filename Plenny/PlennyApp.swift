//
//  PlennyApp.swift
//  Plenny
//
//  Created by Taha Hussein on 18/09/2023.
//

import SwiftUI

@main
struct PlennyApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
