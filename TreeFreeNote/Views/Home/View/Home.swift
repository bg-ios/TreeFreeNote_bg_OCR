//
//  Home.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 29/05/23.
//

import SwiftUI

struct Home: View {
    //Selected Category..
    @Binding var selectedCategory: Category?
    @Binding var bottomSheetContentType: BottomSheetType
    @Binding var isShowingBottomSheet: Bool
    
    var body: some View {
        
        VStack{
            ///NavigationHeaderView
            NavigationHeaderView()
            Spacer(minLength: 1)
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 10, content: {
                    
                    ///ToolsView..
                    ToolsView()
                    Spacer(minLength: 2)
                    
                    ///Search View
                    HomeScreenSearchContainerView(isShowingBottomSheet: $isShowingBottomSheet, bottomSheetContentType: $bottomSheetContentType)
                        .padding(.horizontal, 10)
                    
                    ///Categories View
                    //                    Spacer(minLength: 1)
                    CategoriesView(selectedCategory: $selectedCategory)
                        .padding(10)
                    FoldersHorizontalListView()
                        .frame(height: 140)
                        .padding(.horizontal, 10)
                    Divider()
                    ///Documents ListView
                    DocumentsListView()
                })
            }
        }
        //Light BG Color..
        .background(Color.white.ignoresSafeArea())
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(selectedCategory: .constant(categories.first!), bottomSheetContentType: .constant(.newTag), isShowingBottomSheet: .constant(false))
    }
}
