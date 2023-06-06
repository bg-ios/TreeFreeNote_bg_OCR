//
//  DocumentsListView.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 05/06/23.
//

import SwiftUI

struct DocumentsListView: View {
    @State private var documentsArray = documentModelSamples
    
    var body: some View {
        NavigationView {
            
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 10, pinnedViews: .sectionHeaders) {
                    Section {
                        ForEach(documentsArray) { document in
                            DocumentListCell(document: document)
                                .frame(height: 120)
                                .onTapGesture {
                                    print(document)
                                }
                            Divider()
                        }
                    }
                }
            }
        }
        
    }
    
}

struct DocumentsListView_Previews: PreviewProvider {
    static var previews: some View {
        DocumentsListView()
    }
}
