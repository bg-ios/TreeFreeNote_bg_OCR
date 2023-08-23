//
//  DocumentHandler.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 24/07/23.
//

import UIKit

class DocumentHandler {
    func randomString(length: Int) -> String {
      let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    func saveImageToDocumentDirectory(image: UIImage) -> String? {
        guard let data = image.jpegData(compressionQuality: 1.0) ?? image.pngData() else {
            return nil
        }
//        let dateString = Utility().current_date()
        let randomString = self.randomString(length: 10)
        let fileName = "image_\(randomString).png"

        let fileURL = getDocumentDirectory().appendingPathComponent(fileName)
        
        do {
            try data.write(to: fileURL)
            return fileURL.path
        } catch {
            print("Error saving image: \(error.localizedDescription)")
            return nil
        }
    }
    
    func getDocumentDirectory() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    func loadImageFromDocumentDirectory(fileName: String) -> UIImage? {
        
        var fileURL = fileName
        if !(fileName.contains("file://") ) {
            fileURL = "file://" + (fileName)
        }
        if let url = URL(string: fileURL) {
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                return image
            }
        }
        if let loaded = UIImage.init(contentsOfFile: fileURL) {
            return loaded
        }
        return nil
    }

}



/*
{
    
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

*/

