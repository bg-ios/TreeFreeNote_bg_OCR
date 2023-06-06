//
//  HomeScreenSearchContainerView.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 06/06/23.
//

import SwiftUI

struct HomeScreenSearchContainerView: View {
    
    @State var searchText: String = "Text"
        
    var body: some View {
        
        HStack(spacing: 10) {
            SearchView(searchText: $searchText, placeHolderText: "Search") {
                print(searchText)
            }
            
            CustomLogoButton(imageName: "selectIcon") {
                print("selection button clicked")
            }
            CustomLogoButton(imageName: "tagIcon") {
                print("Tag button clicked")
            }
            CustomLogoButton(imageName: "addFolder") {
                print("Folder button clicked")
            }
            CustomLogoButton(imageName: "moreIcon") {
                print("More button clicked")
            }
        }
    }
}

struct HomeScreenSearchContainerView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenSearchContainerView()
    }
}
