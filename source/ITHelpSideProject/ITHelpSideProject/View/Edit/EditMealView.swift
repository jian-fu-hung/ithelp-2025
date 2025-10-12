///**
/**
 
 ITHelpSideProject
 Created by:  Jerry  on 2025/10/13
 Copyright (c) 2017 My Company
 
 */


import SwiftUI
import SwiftData

struct EditMealView: View {
    
    @ObservedObject var viewModel: MealDetailViewModel
    
    @Environment(\.dismiss) private var dismiss
    
    
    
    var body: some View {
        Form {
            // 餐點資訊
            Section("餐點資訊") {
                TextField("餐點名稱", text: $viewModel.meal.name)
                
                // 卡路里
                TextField("卡路里", value: $viewModel.meal.calories, format: .number)
                    .keyboardType(.numberPad)
                
                // 餐別 Picker
                Picker("餐別", selection: $viewModel.meal.category) {
                    ForEach(MealCategory.allCases, id: \.self) { category in
                        Text(category.rawValue)
                    }
                }
            }
            
            // 儲存按鈕
            Section {
                Button("儲存") {
                    viewModel.showEditView = false
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        .navigationTitle("編輯餐點")
    }
}

#Preview {
    EditMealView(viewModel: MealDetailViewModel(meal: MealRecord(name: "燕麥牛奶", calories: 200, category: .breakfast, date: Date())))
}
