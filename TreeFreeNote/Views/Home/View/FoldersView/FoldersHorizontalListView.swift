//
//  FoldersHorizontalListView.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 06/06/23.
//

import SwiftUI

struct FoldersHorizontalListView: View {
    @State private var foldersArray: [Dictionary<String, Any>] = [] // State to hold fetched data

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 10) {
                ForEach($foldersArray) { folderInfo in
                    NavigationLink {
//                        DocumentsDetailedView(documentInfo: document)
                    } label: {
                        CustomFoldersListCell(folderInfo: folderInfo)
                            .frame(width: 200, height: 120)
                    }
                }
            }
        }
        .frame(height: 120)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.foldersArray = querys().getHomePageInfo() // Update the @State property with fetched data
            }

        }
    }
}

//struct FoldersHorizontalListView_Previews: PreviewProvider {
//    static var previews: some View {
//        FoldersHorizontalListView()
//    }
//}
