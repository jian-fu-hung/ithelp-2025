///**
/**

ITHelpSideProject
Created by:  Jerry  on 2025/10/10
Copyright (c) 2017 My Company

*/

import SwiftUI

@main
struct ITHelpSideProjectApp: App {
    var body: some Scene {
        WindowGroup {
            DashboardView()
        }
        .modelContainer(for: MealRecord.self)
    }
}
