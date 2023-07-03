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
            VStack(alignment: .leading) {
                HStack(spacing: 10) {
                    Button {
                        print("Search Action")
                    } label: {
                        HStack {
                            ///Search View
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(Color.gray)
                                .padding(.leading, -8)
                            Text("Search")
                                .foregroundColor(Color.gray.opacity(0.6))
                                .padding(.leading, -5)
                                .frame(height: 30)
                                .frame(alignment: .leading)
                            Spacer()
                        }
                        .padding()
                        .frame(height: 30)
                        .frame(minWidth: 0,
                               maxWidth: .infinity)
                        .background(Color.clear)
                        .clipShape(Capsule())
                        .overlay(Capsule()
                            .stroke(.gray, lineWidth: 1))
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
}

struct HomeScreenSearchContainerView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenSearchContainerView(isShowingBottomSheet: .constant(false), bottomSheetContentType: .constant(.newTag))
    }
}
