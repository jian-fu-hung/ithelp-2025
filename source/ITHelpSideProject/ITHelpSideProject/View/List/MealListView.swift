///**
/**
 
 ITHelpSideProject
 Created by:  Jerry  on 2025/10/12
 Copyright (c) 2017 My Company
 
 */


import SwiftUI
import SwiftData

struct MealListView: View {
    @Environment(\.modelContext) private var modelContext
    @StateObject private var viewModel = MealListViewModel()
    
    var body: some View {
        VStack() {
            if (viewModel.records.isEmpty) {
                Text("尚未新增餐點")
                    .foregroundColor(.gray)
            } else {
                List {
                    ForEach(viewModel.records) { meal in
                        VStack(alignment: .leading, spacing: 6) {
                            Text(meal.name)
                                .font(.headline)
                            Text("\(meal.calories) 大卡")
                                .foregroundColor(.gray)
                            Text(meal.category.rawValue)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        .padding(.vertical, 4)
                    }
                    .onDelete {indexSet in
                        viewModel.delete(at:indexSet)
                    }
                }
            }
        }.navigationTitle("飲食紀錄")
            .toolbar {
                NavigationLink(destination: AddMealView()) {
                    Image(systemName: "plus")
                }
            }
            .onAppear {
                viewModel.configure(context: modelContext)
            }
        
    }
    
}


#Preview {
    MealListView()
}
