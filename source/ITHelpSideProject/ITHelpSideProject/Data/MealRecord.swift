///**
/**

ITHelpSideProject
Created by:  Jerry  on 2025/10/10
Copyright (c) 2017 My Company

*/

import Foundation

struct MealRecord: Identifiable {
    let id = UUID()
    let name: String
    let calories: Int
    let category: MealCategory
    let date: Date
}
