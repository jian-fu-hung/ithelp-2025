///**
/**

ITHelpSideProject
Created by:  Jerry  on 2025/10/10
Copyright (c) 2017 My Company

*/

import Foundation
import SwiftData

@Model
class MealRecord {
    var id: UUID
    var name: String
    var calories: Int
    var category: MealCategory
    var date: Date
    
    init(
        id: UUID = UUID(),
        name: String,
        calories: Int,
        category: MealCategory,
        date: Date = .now
    ) {
        self.id = id
        self.name = name
        self.calories = calories
        self.category = category
        self.date = date
    }
}
