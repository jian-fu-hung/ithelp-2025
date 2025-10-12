///**
/**

ITHelpSideProject
Created by:  Jerry  on 2025/10/11
Copyright (c) 2017 My Company

*/


import SwiftData
import Foundation

class MealRepository: ObservableObject {
    static let shared = MealRepository()
    
    @Published private(set) var records: [MealRecord] = []
    
    private var modelContext: ModelContext?
    
    func configure(context: ModelContext) async{
        self.modelContext = context
        await fetchAll()
    }
    
    func addMeal(name: String, calories: Int, category: MealCategory) async{
        guard let context = modelContext else { return }
                
        let newMeal = MealRecord(
            name: name,
            calories: calories,
            category: category,
            date: .now
        )
        
        context.insert(newMeal)
                
        do {
            try context.save()
            await fetchAll() // 重新抓取資料
        } catch {
            print("無法儲存資料：\(error)")
        }
    }
    
    func fetchAll() async{
        guard let context = modelContext else { return }
            
        let descriptor = FetchDescriptor<MealRecord>(
            sortBy: [SortDescriptor(\.date, order: .reverse)]
        )
            
        do {
            records = try context.fetch(descriptor)
        } catch {
            print("無法讀取資料：\(error)")
        }
    }
    
    
    func delete(_ record: MealRecord) async{
        guard let context = modelContext else { return }
        context.delete(record)
        
        do {
            try context.save()
            await fetchAll()
        } catch {
            print("無法刪除資料：\(error)")
        }
    }
}
