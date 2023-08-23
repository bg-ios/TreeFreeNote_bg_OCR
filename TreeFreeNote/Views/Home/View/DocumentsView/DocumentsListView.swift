//
//  DocumentsListView.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 05/06/23.
//

import SwiftUI

struct DocumentsListView: View {
//    @Binding var isTabViewShown: Bool

    @ObservedObject var documentViewModel = DocumentsViewModel()
    var body: some View {
        
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 10, pinnedViews: .sectionHeaders) {
                ForEach($documentViewModel.documentsList){ $document in
                    NavigationLink {
                        if let detailedImage = self.navigateToDetailedView(document: document.title) {
                            ScannedImagePreviewView(imageNames: [detailedImage] , isFromScanner: false, documentsViewModel: documentViewModel)
                        }
                    } label: {
                        DocumentListCell(document: $document)
                            .frame(height: 100)
                    }
                    Divider()
                }
            }
            
        }
    }
    
    func navigateToDetailedView(document : String) -> UIImage? {
        if let image = DocumentHandler().loadImageFromDocumentDirectory(fileName: document) {
            return image
        }
        return nil
    }
    
}

//struct DocumentsListView_Previews: PreviewProvider {
//    static var previews: some View {
//        DocumentsListView(documentViewModel: <#DocumentsViewModel#>)
//    }
//}
