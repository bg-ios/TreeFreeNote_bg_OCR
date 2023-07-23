//
//  DocumentModel.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 11/07/23.
//

import Foundation

struct Document {
    let id: String
    let title: String
    let creationDate: Date
    let fileFormat: String
    var pages: [ScannedPage]
}
