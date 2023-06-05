//
//  DocumentsListView.swift
//  TreeFreeNote
//
//  Created by Baby on 05/06/23.
//

import SwiftUI

struct DocumentsListView: View {
    @State private var documentsArray = documentModelSamples
    
    var body: some View {
        NavigationView {
            List {
                ForEach(documentsArray) { document in
                    DocumentListCell(document: document)
                        .frame(height: 120)
                }
            }
            .listStyle(.plain)
        }
    }
}

struct DocumentsListView_Previews: PreviewProvider {
    static var previews: some View {
        DocumentsListView()
    }
}
