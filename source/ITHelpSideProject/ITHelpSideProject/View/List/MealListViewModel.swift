///**
/**

ITHelpSideProject
Created by:  Jerry  on 2025/10/12
Copyright (c) 2017 My Company

*/

import SwiftUI
import SwiftData


class MealListViewModel: ObservableObject {
    @Published var records: [MealRecord] = []
    
    private let repository = MealRepository.shared
    
    init() {
        // 監聽 repository 的變化
        repository.$records
            .receive(on: RunLoop.main)
            .assign(to: &$records)
    }
    
    func configure(context: ModelContext) {
        Task {
            await repository.configure(context: context)
        }
    }
    
    /// 重新從資料庫載入
    func refresh() {
        Task {
            await repository.fetchAll()
        }
    }
    
    /// 新增一筆餐點紀錄
    func addMeal(name: String, calories: Int, category: MealCategory) {
        Task {
            await repository.addMeal(name: name, calories: calories, category: category)
        }
    }
    
    /// 刪除一筆紀錄
    func delete(at offsets: IndexSet) {
        for index in offsets {
            let record = records[index]
            Task {
                await repository.delete(record)
            }
        }
    }
}
