//
//  SaveItRightApp.swift
//  SaveItRight
//
//  Created by Lamia AlSiddiqi on 14/07/1444 AH.
//

import SwiftUI

@main
struct SaveItRightApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainPage()
                .preferredColorScheme(.dark)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
