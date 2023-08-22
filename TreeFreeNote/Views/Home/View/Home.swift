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
    
    @ObservedObject var categoriesViewModel : CategoriesViewModel

    var body: some View {
        NavigationView {
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
                        CategoriesView(categoriesViewModel: categoriesViewModel)
                            .padding(10)
                        //                        Spacer(minLength: 2)
                        FoldersHorizontalListView()
                            .frame(height: 120)
                        
                        Divider()
                        ///Documents ListView
                        DocumentsListView()
                    })
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
            .navigationBarHidden(true)
            .navigationBarTitle(Text("Home"))
//            .edgesIgnoringSafeArea([.top, .bottom])

            //Light BG Color..
            .background(Color.white.ignoresSafeArea())
        }
    }
}

//struct Home_Previews: PreviewProvider {
////    static var previews: some View {
////        Home(selectedCategory: .constant(categories.first!), bottomSheetContentType: .constant(.newTag), isShowingBottomSheet: .constant(false), categoriesViewModel: .constant(CategoriesViewModel()))
////    }
//}
