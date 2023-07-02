//
//  HomeScreenSearchContainerView.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 06/06/23.
//

import SwiftUI

struct HomeScreenSearchContainerView: View {
    
    @State var searchText: String = "Text"
    @Binding var isShowingBottomSheet: Bool
    
    @Binding var bottomSheetContentType: BottomSheetType

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
                    bottomSheetContentType = .newTag
                    isShowingBottomSheet.toggle()
                    
                }
                CustomLogoButton(imageName: "addFolder") {
                    print("Folder button clicked")
                    bottomSheetContentType = .newFolder
                    isShowingBottomSheet.toggle()
                }
                CustomLogoButton(imageName: "moreIcon") {
                    print("More button clicked")
                    bottomSheetContentType = .eraseAlertView
                    isShowingBottomSheet.toggle()

                }
            }

        }
    }
}

struct HomeScreenSearchContainerView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenSearchContainerView(isShowingBottomSheet: .constant(false), bottomSheetContentType: .constant(.newTag))
    }
}
