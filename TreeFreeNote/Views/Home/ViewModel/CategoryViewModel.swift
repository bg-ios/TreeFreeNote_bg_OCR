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
           let savedItems = try? JSONDecoder().decode([Category].self, from: data) {
            categories = savedItems
        } else {
            let defultCategories = [
                Category(title: "All"),
                Category(title: "Started"),
                Category(title: "Most Viewed")]
            
            for category in defultCategories {
                self.addCategory(category)
            }
        }
    }
    
    func addCategory(_ category: Category) {
        categories.append(category)
        if let encodedData = try? JSONEncoder().encode(categories) {
            UserDefaults.standard.set(encodedData, forKey: categoriesTag)
        }
    }
}
