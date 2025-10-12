///**
/**

ITHelpSideProject
Created by:  Jerry  on 2025/10/13
Copyright (c) 2017 My Company

*/


import SwiftUI
import SwiftData
import Combine


class MealDetailViewModel: ObservableObject {
    @Published var meal: MealRecord
    @Published var showEditView = false
    @Published var showDeleteAlert = false
    @Published var deleteSuccess = false
    
    private let repository = MealRepository.shared
    
    init(meal: MealRecord, ) {
        self.meal = meal
    }
    
    func onAppear(modelContext: ModelContext) {
        Task {
            await repository.configure(context: modelContext)
        }
    }
    
    func deleteMeal() {
        Task {
            await repository.delete(meal)
        }
        deleteSuccess = true
    }
    
    func editMeal() {
        showEditView = true
    }
    
    func dismissEditView() {
        showEditView = false
    }
}

