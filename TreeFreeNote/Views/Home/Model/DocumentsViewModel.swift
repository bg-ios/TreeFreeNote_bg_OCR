//
//  DocumentsViewModel.swift
//  TreeFreeNote
//
//  Created by Baby on 23/08/23.
//

import Foundation

class DocumentsViewModel : ObservableObject {
    @Published var documentsList: [Document] = []

    init() {
        // Load data from UserDefaults during initialization
        if let data = UserDefaults.standard.data(forKey: sannedImages),
           let savedItems = try? JSONDecoder().decode([Document].self, from: data) {
            documentsList = savedItems
        }
    }
    
    func addDocument(_ document: Document) {
        documentsList.append(document)
        if let encodedData = try? JSONEncoder().encode(documentsList) {
            UserDefaults.standard.set(encodedData, forKey: sannedImages)
        }
    }
    
}

