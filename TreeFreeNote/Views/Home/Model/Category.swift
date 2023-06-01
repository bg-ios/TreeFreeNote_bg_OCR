//
//  Category.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 29/05/23.
//

import Foundation
// Model and Sample Data

struct Category: Identifiable, Equatable {
    var id: String = UUID().uuidString
    var title: String
}

var categories = [
    Category(title: "All"),
    Category(title: "Started"),
    Category(title: "Most Viewed"),
    Category(title: "College Documents"),
    Category(title: "Business Cards"),
    Category(title: "ID Proofs")
]
