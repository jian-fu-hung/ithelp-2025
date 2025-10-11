///**
/**

ITHelpSideProject
Created by:  Jerry  on 2025/10/11
Copyright (c) 2017 My Company

*/



import Foundation

class MealRepository: ObservableObject {
    static let shared = MealRepository()
    
    @Published private(set) var records: [MealRecord] = []
    
    private init() {}
    
    func addMeal(name: String, calories: Int, category: MealCategory) {
        let newMeal = MealRecord(
            name: name,
            calories: calories,
            category: category,
            date: Date()
        )
        records.append(newMeal)
    }
}
