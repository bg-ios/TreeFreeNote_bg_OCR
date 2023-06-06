//
//  FoldersHorizontalListView.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 06/06/23.
//

import SwiftUI

struct FoldersHorizontalListView: View {
    var body: some View {
        NavigationView {
        ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(documentModelSamples) { document in
                        CustomFoldersListCell(filesCount: .constant(""))
                            .frame(width: 200, height: 140)
                    }
                }
            }
        }
    }
}

struct FoldersHorizontalListView_Previews: PreviewProvider {
    static var previews: some View {
        FoldersHorizontalListView()
    }
}
