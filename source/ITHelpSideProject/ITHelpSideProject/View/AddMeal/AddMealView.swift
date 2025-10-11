///**
/**

ITHelpSideProject
Created by:  Jerry  on 2025/10/11
Copyright (c) 2017 My Company

*/

import SwiftUI

struct AddMealView: View {
    @Environment(\.dismiss) private var dismiss
    
    @StateObject private var viewModel = AddMealViewModel()


    var body: some View {
        Form {
            Section(header: Text("餐點資訊")) {
                TextField("餐點名稱", text: $viewModel.mealName)
                TextField("卡路里", text: $viewModel.mealCalories)
                    .keyboardType(.numberPad)
                
                Picker("餐別", selection: $viewModel.mealCategory) {
                    ForEach(MealCategory.allCases, id: \.self) { category in
                        Text(category.rawValue)
                    }
                }
            }
            
            Section {
                Button("儲存") {
                    viewModel.addMeal()
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        .alert("請輸入完整資訊", isPresented: $viewModel.showAlert) {
            Button("確定", role: .cancel) {}
        }
        .onChange(of: viewModel.addSuccess) { _, success in
            if success {
                viewModel.addSuccess = false
                dismiss()
            }
        }
        .navigationTitle("新增記錄")
    }
}

#Preview {
    AddMealView()
}
