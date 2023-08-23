//
//  DocumentsListView.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 05/06/23.
//

import SwiftUI

struct DocumentsListView: View {
    @State private var documentsArray = documentModelSamples
    
    @ObservedObject var documentViewModel = DocumentsViewModel()

    var body: some View {
        
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 10, pinnedViews: .sectionHeaders) {
                ForEach($documentViewModel.documentsList){ document in
                    NavigationLink {
                        
//                        DocumentsDetailedView(documentInfo: document)
                    } label: {
                        DocumentListCell(document: document)
                            .frame(height: 100)
                    }
                    Divider()
                }
            }
            
        }
    }
    
    func convertImagePathsToImage() -> [UIImage]? {
        
        return nil
    }
    
}

//struct DocumentsListView_Previews: PreviewProvider {
//    static var previews: some View {
//        DocumentsListView(documentViewModel: <#DocumentsViewModel#>)
//    }
//}
