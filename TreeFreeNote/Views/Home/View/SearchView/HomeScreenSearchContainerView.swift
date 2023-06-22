//
//  HomeScreenSearchContainerView.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 06/06/23.
//

import SwiftUI

struct HomeScreenSearchContainerView: View {
    
    @State var searchText: String = "Text"
        
    @State var isShowingBottomSheet = false

    var body: some View {
        ZStack {
            HStack(spacing: 10) {
                SearchView(searchText: $searchText, placeHolderText: "Search") {
                    print(searchText)
                }
                
                CustomLogoButton(imageName: "selectIcon") {
                    print("selection button clicked")
                }
                CustomLogoButton(imageName: "tagIcon") {
                    print("Tag button clicked")
                    BottomSheet(isShowing: $isShowingBottomSheet, content: BottomSheetType.newTag.view())
                    
                }
                CustomLogoButton(imageName: "addFolder") {
                    print("Folder button clicked")
                    BottomSheet(isShowing: $isShowingBottomSheet, content: BottomSheetType.newFolder.view())
                    
                }
                CustomLogoButton(imageName: "moreIcon") {
                    print("More button clicked")
                }
            }
            BottomSheet(isShowing: $isShowingBottomSheet, content: BottomSheetType.newTag.view())

        }
    }
}

struct HomeScreenSearchContainerView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenSearchContainerView()
    }
}
