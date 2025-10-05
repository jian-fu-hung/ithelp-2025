///**
/**

ITHelpDay20
Created by:  Jerry  on 2025/10/5
Copyright (c) 2017 My Company

*/

import SwiftUI

@main
struct ITHelpDay20App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
