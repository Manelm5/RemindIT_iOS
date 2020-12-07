//
//  RemindItApp.swift
//  RemindIt
//
//  Created by Manel Muñiz on 21/11/2020.
//

import SwiftUI

@main
struct RemindItApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
