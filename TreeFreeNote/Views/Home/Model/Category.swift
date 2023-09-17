//
//  Category.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 29/05/23.
//

import Foundation
// Model and Sample Data

struct Category: Identifiable, Equatable, Codable, Hashable {
    var id = UUID()
    var title: String
    var isSelected: Bool = false
    
    mutating func updateState(selectedState: Bool) {
        self.isSelected = selectedState
    }
}

//struct CategoriesModel {
//    private(set) var categories :[Category] = []
//
//    mutating func addCategory(_ category: Category){
//        categories.append(category)
//    }
//}

var categories = [
    Category(title: "All"),
    Category(title: "Starred"),
    Category(title: "Most Viewed"),
    Category(title: "College Documents"),
    Category(title: "Business Cards"),
    Category(title: "ID Proofs")
]
