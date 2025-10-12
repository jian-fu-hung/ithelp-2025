///**
/**

ITHelpSideProject
Created by:  Jerry  on 2025/10/11
Copyright (c) 2017 My Company

*/
import SwiftUI


class AddMealViewModel: ObservableObject {
    @Published var mealName: String = ""
    @Published var mealCalories: String = ""
    @Published var mealCategory: MealCategory = .breakfast
    @Published var showAlert: Bool = false
    @Published var addSuccess: Bool = false
    
    private let repository = MealRepository.shared
    
    
    func addMeal() {
        guard !mealName.trimmingCharacters(in: .whitespaces).isEmpty else {
            showAlert = true
            return
        }
        
        
        guard let calories = Int(mealCalories),
              !mealCalories.trimmingCharacters(in: .whitespaces).isEmpty else {
            showAlert = true
            return
        }
              
        Task {
            await repository.addMeal(
                name: mealName,
                calories: calories,
                category: mealCategory
            )
        }

                
        // 清空輸入
        mealName = ""
        mealCalories = ""
        mealCategory = .breakfast
        addSuccess = true
    }
}
