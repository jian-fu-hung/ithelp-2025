///**
/**

ITHelpSideProject
Created by:  Jerry  on 2025/10/10
Copyright (c) 2017 My Company

*/

import SwiftUI


struct DashboardView: View {
    @Environment(\.modelContext) private var modelContext
    @StateObject private var viewModel = DashboardViewModel()
    
    
    var body: some View {
        NavigationView {
            List {
                // 營養統計區塊
                Section {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("今日總計")
                            .font(.headline)
                        Text("卡路里：\(viewModel.totalCalories) kcal")
                        HStack {
                            Label("蛋白質：\(viewModel.protein)g", systemImage: "bolt.heart")
                            Spacer()
                            Label("碳水：\(viewModel.carbs)g", systemImage: "leaf")
                            Spacer()
                            Label("脂肪：\(viewModel.fat)g", systemImage: "drop")
                        }
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 8)
                }
                
                // 餐別清單
                ForEach(MealCategory.allCases, id: \.self) { category in
                    Section(header: Text(category.rawValue)) {
                        let meals = viewModel.records.filter { $0.category == category}
                        if meals.isEmpty {
                            Text("尚未新增餐點")
                                .foregroundColor(.gray)
                        } else {
                            ForEach(meals) { meal in
                                HStack {
                                    Text(meal.name)
                                    Spacer()
                                    Text("\(meal.calories) kcal")
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    }
                }
                
                // 新增記錄按鈕
                Section {
                    NavigationLink(destination: AddMealView()) {
                            Label("新增記錄", systemImage: "plus.circle.fill")
                                .font(.headline)
                                .foregroundColor(.blue)
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                Section {
                    NavigationLink(destination: MealListView()) {
                        Label("查看所有飲食紀錄", systemImage: "list.bullet.rectangle")
                            .font(.headline)
                            .foregroundColor(.orange)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                
            }
            .navigationTitle("今日飲食")
        }
        .onAppear {
            viewModel.configure(context: modelContext)
        }
    }
}



#Preview {
    DashboardView()
}
