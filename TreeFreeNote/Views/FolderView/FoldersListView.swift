//
//  FoldersListView.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 21/08/23.
//

import SwiftUI

struct FoldersListView : View {
    
    var foldersArray: Array<String>
    
    
    var body: some View {
        
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 10, pinnedViews: .sectionHeaders) {
                ForEach(foldersArray, id: \.self) { folderName in
                    NavigationLink {
//                        DocumentsDetailedView(documentInfo: document)
                    } label: {
                        VStack {
                            Text(folderName)
                                .font(.title2)
                                .foregroundColor(Color.black)
                        }
                    }
                    Divider()
                }
            }
        }
    }
    
}

struct FoldersListView_Previews: PreviewProvider {
    static var previews: some View {
        FoldersListView(foldersArray: ["Document"])
    }
}
