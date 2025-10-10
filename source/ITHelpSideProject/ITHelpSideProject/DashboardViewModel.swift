///**
/**

ITHelpSideProject
Created by:  Jerry  on 2025/10/10
Copyright (c) 2017 My Company

*/

import SwiftUI

class MealViewModel: ObservableObject {
    @Published var records: [MealRecord] = [
        MealRecord(name: "燕麥牛奶", calories: 200, category: .breakfast, date: Date()),
        MealRecord(name: "雞胸肉便當", calories: 500, category: .lunch, date: Date()),
        MealRecord(name: "沙拉", calories: 300, category: .dinner, date: Date()),
        MealRecord(name: "香蕉", calories: 100, category: .snack, date: Date())
    ]
    
    var totalCalories: Int {
        records.reduce(0) { $0 + $1.calories }
    }
    
    // 假資料
    var protein: Int { 60 }
    var carbs: Int { 150 }
    var fat: Int { 40 }
}
