///**
/**

ITHelpSideProject
Created by:  Jerry  on 2025/10/13
Copyright (c) 2017 My Company

*/


import SwiftUI
import SwiftData

struct MealDetailView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @StateObject private var viewModel: MealDetailViewModel
    
    init(meal: MealRecord) {
        _viewModel = StateObject(wrappedValue: MealDetailViewModel(
            meal: meal,
        ))
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(viewModel.meal.name)
                .font(.largeTitle)
                .bold()
            
            Divider()
            
            VStack(alignment: .leading, spacing: 8) {
                Text("熱量：\(viewModel.meal.calories) kcal")
                Text("餐別：\(viewModel.meal.category.rawValue)")
                
            }
            
            Spacer()
            
            HStack {
                Button("編輯") {
                    viewModel.editMeal()
                }
                .buttonStyle(.borderedProminent)
                
                Button("刪除", role: .destructive) {
                    viewModel.showDeleteAlert = true
                }
                .buttonStyle(.bordered)
            }
        }
        .padding()
        .navigationTitle("詳細資訊")
        .toolbar(.hidden, for: .tabBar)
        .alert("確定要刪除此紀錄？", isPresented: $viewModel.showDeleteAlert) {
            Button("刪除", role: .destructive) {
                viewModel.deleteMeal()
            }
            Button("取消", role: .cancel) { }
        }
        .sheet(isPresented: $viewModel.showEditView) {
            EditMealView(viewModel: viewModel)
        }
        .onAppear() {
            viewModel.onAppear(modelContext: modelContext)
        }
        .onChange(of: viewModel.deleteSuccess) { _, success in
            if success {
                viewModel.deleteSuccess = false
                dismiss()
            }
        }
    }
}

#Preview {
    MealDetailView(meal: MealRecord(name: "燕麥牛奶", calories: 200, category: .breakfast, date: Date()))
}

