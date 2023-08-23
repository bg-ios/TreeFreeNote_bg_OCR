//
//  DocumentsViewModel.swift
//  TreeFreeNote
//
//  Created by Baby on 23/08/23.
//

import Foundation

public class DocumentsViewModel : ObservableObject {
    @Published var documentsList: [Document] = []

    init() {
        // Load data from UserDefaults during initialization
        if let data = UserDefaults.standard.data(forKey: sannedImages),
           let savedItems = try? JSONDecoder().decode([Document].self, from: data) {
            documentsList = savedItems//.reversed()
        }
    }
    
    func addDocument(_ document: Document) {
        documentsList.insert(document, at: 0)
        if let encodedData = try? JSONEncoder().encode(documentsList) {
            UserDefaults.standard.set(encodedData, forKey: sannedImages)
        }
    }
    
}

