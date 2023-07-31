//
//  FoldersHorizontalListView.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 06/06/23.
//

import SwiftUI

struct FoldersHorizontalListView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 10) {
                ForEach(documentModelSamples) { document in
                    NavigationLink {
                        DocumentsDetailedView(documentInfo: document)
                    } label: {
                        CustomFoldersListCell(filesCount: .constant(""))
                            .frame(width: 200, height: 120)
                    }
                }
            }
        }
        .frame(height: 120)
    }
}

struct FoldersHorizontalListView_Previews: PreviewProvider {
    static var previews: some View {
        FoldersHorizontalListView()
    }
}
