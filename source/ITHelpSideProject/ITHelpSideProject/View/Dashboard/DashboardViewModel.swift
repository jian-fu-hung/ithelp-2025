///**
/**

ITHelpSideProject
Created by:  Jerry  on 2025/10/10
Copyright (c) 2017 My Company

*/

import SwiftUI

class DashboardViewModel: ObservableObject {
    @Published var records: [MealRecord] = []
    
    private let repository = MealRepository.shared
    
    init() {
        // 監聽 repository 的變化
        repository.$records
            .receive(on: RunLoop.main)
            .assign(to: &$records)
    }
    
    var totalCalories: Int {
        records.reduce(0) { $0 + $1.calories }
    }
    
    // 假資料
    var protein: Int { 60 }
    var carbs: Int { 150 }
    var fat: Int { 40 }
}
