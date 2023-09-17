//
//  CategoryViewModel.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 08/08/23.
//

import Foundation

class CategoriesViewModel: ObservableObject {
    @Published var categories: [Category] = []

    init() {
        // Load data from UserDefaults during initialization
        if let data = UserDefaults.standard.data(forKey: categoriesTag),
           var savedItems = try? JSONDecoder().decode([Category].self, from: data) {
            for index in 0..<savedItems.count {
                savedItems[index].isSelected = (index == 0)
            }
            categories = savedItems
        } else {
            let defultCategories = [
                Category(title: "All"),
                Category(title: "Starred"),
                Category(title: "Most Viewed")]
            
            for (index, category) in defultCategories.enumerated() {
                if index == 0 {
                    var category = category
                    category.updateState(selectedState: true)
                    self.addCategory(category)
                } else {
                    self.addCategory(category)
                }
            }
        }
    }
    
    func addCategory(_ category: Category) {
        categories.append(category)
        if let encodedData = try? JSONEncoder().encode(categories) {
            UserDefaults.standard.set(encodedData, forKey: categoriesTag)
        }
    }
    
    func updateStateForCategory(category: Category) {
        for index in 0..<categories.count  {
            self.categories[index].isSelected = false
            if categories[index].id == category.id {
                self.categories[index].isSelected = true
            }
        }
            
        objectWillChange.send()
    }
}
