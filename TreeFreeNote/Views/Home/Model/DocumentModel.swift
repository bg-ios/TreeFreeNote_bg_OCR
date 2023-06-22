//
//  DocumentModel.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 30/05/23.
//

import Foundation

struct DocumentModel {
    var id: String = UUID().uuidString
    let name: String
    let imageName: String
    let dateCreated: String
    let cloudAccount: String
    let documentFolderName: String
    let pagesCount: Int
//    let description: String
    var isFavorite: Bool = false
    var isCloudSynced: Bool = false
}

extension DocumentModel: Decodable{}

extension DocumentModel: Identifiable {}

extension DocumentModel: Equatable {}

let documentModelSamples = [
    DocumentModel(name: "Job Application Letter Job Application Letter Job Application Letter", imageName: "fig", dateCreated: "12/03/2023", cloudAccount: "bhargavi@gmail.com", documentFolderName: "Personal", pagesCount: 2, isFavorite: true, isCloudSynced: true),
    DocumentModel(name: "Application Letter", imageName: "avocado", dateCreated: "12/03/2023", cloudAccount: "bhargavi@gmail.com", documentFolderName: "Academics", pagesCount: 2, isFavorite: true, isCloudSynced: true),
    DocumentModel(name: "Application Letter", imageName: "banana", dateCreated: "12/03/2023", cloudAccount: "bhargavi@gmail.com", documentFolderName: "College Document", pagesCount: 2, isFavorite: true, isCloudSynced: true),
    DocumentModel(name: "Application Letter", imageName: "pineapple", dateCreated: "12/03/2023", cloudAccount: "bhargavi@gmail.com", documentFolderName: "Academics", pagesCount: 2, isFavorite: true, isCloudSynced: true),
    DocumentModel(name: "Job Application Letter", imageName: "watermelon", dateCreated: "12/03/2023", cloudAccount: "bhargavi@gmail.com", documentFolderName: "Business", pagesCount: 2, isFavorite: true, isCloudSynced: true),
    DocumentModel(name: "Application Letter", imageName: "blueberry", dateCreated: "12/03/2023", cloudAccount: "bhargavi@gmail.com", documentFolderName: "Personal", pagesCount: 2, isFavorite: true, isCloudSynced: true),
    DocumentModel(name: "Job Application Letter", imageName: "pineapple", dateCreated: "12/03/2023", cloudAccount: "bhargavi@gmail.com", documentFolderName: "College Document", pagesCount: 2, isFavorite: true, isCloudSynced: true),
    DocumentModel(name: "Application Letter", imageName: "blueberry", dateCreated: "12/03/2023", cloudAccount: "bhargavi@gmail.com", documentFolderName: "Personal", pagesCount: 2, isFavorite: true, isCloudSynced: true),
    DocumentModel(name: "Job Application Letter", imageName: "banana", dateCreated: "12/03/2023", cloudAccount: "bhargavi@gmail.com", documentFolderName: "Business", pagesCount: 2, isFavorite: true, isCloudSynced: true),
    DocumentModel(name: "Job Application Letter Job Application Letter Job Application Letter", imageName: "fig", dateCreated: "12/03/2023", cloudAccount: "bhargavi@gmail.com", documentFolderName: "Personal", pagesCount: 2, isFavorite: true, isCloudSynced: true),
    DocumentModel(name: "Application Letter", imageName: "avocado", dateCreated: "12/03/2023", cloudAccount: "bhargavi@gmail.com", documentFolderName: "Academics", pagesCount: 2, isFavorite: true, isCloudSynced: true),
    DocumentModel(name: "Application Letter", imageName: "banana", dateCreated: "12/03/2023", cloudAccount: "bhargavi@gmail.com", documentFolderName: "College Document", pagesCount: 2, isFavorite: true, isCloudSynced: true),
    DocumentModel(name: "Application Letter", imageName: "pineapple", dateCreated: "12/03/2023", cloudAccount: "bhargavi@gmail.com", documentFolderName: "Academics", pagesCount: 2, isFavorite: true, isCloudSynced: true),
    DocumentModel(name: "Job Application Letter", imageName: "watermelon", dateCreated: "12/03/2023", cloudAccount: "bhargavi@gmail.com", documentFolderName: "Business", pagesCount: 2, isFavorite: true, isCloudSynced: true),
    DocumentModel(name: "Application Letter", imageName: "blueberry", dateCreated: "12/03/2023", cloudAccount: "bhargavi@gmail.com", documentFolderName: "Personal", pagesCount: 2, isFavorite: true, isCloudSynced: true),
    DocumentModel(name: "Job Application Letter", imageName: "pineapple", dateCreated: "12/03/2023", cloudAccount: "bhargavi@gmail.com", documentFolderName: "College Document", pagesCount: 2, isFavorite: true, isCloudSynced: true),
    DocumentModel(name: "Application Letter", imageName: "blueberry", dateCreated: "12/03/2023", cloudAccount: "bhargavi@gmail.com", documentFolderName: "Personal", pagesCount: 2, isFavorite: true, isCloudSynced: true),
    DocumentModel(name: "Job Application Letter", imageName: "banana", dateCreated: "12/03/2023", cloudAccount: "bhargavi@gmail.com", documentFolderName: "Business", pagesCount: 2, isFavorite: true, isCloudSynced: true),
    ]


struct Document {
    let id: String
    let title: String
    let creationDate: Date
    let fileFormat: String
    var pages: [ScannedPage]
}

struct ScannedPage {
    let pageNumber: Int
    let imagePath: String // File path or image data
    // Additional metadata properties as needed
}


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
    
    // Other methods as per your app's requirements
}



