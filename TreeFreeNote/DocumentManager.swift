//
//  DocumentManager.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 11/07/23.
//

import Foundation

class DocumentManager {
    private var documents: [Document] = []
    
    func createDocument(withTitle title: String, fileFormat: String) {
        // Create a new Document object and add it to the documents array
    }
    
    func addScannedPage(_ page: ScannedPage, toDocument document: Document) {
        // Add the scanned page to the specified document
    }
    
    func removeScannedPage(atIndex index: Int, fromDocument document: Document) {
        // Remove the scanned page at the specified index from the document
    }
    
    func saveDocument(_ document: Document) {
        // Save the document to storage
    }
    
    func retrieveDocuments() -> [Document] {
        // Retrieve and return the list of saved documents from storage
        return documents
    }
    
    // Other methods as per app's requirements
}



