//
//  CategoriesView.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 29/05/23.
//

import SwiftUI

struct CategoriesView: View {
    
    @Binding var selectedCategory: Category?
    @ObservedObject var categoriesViewModel = CategoriesViewModel()

    @Namespace var animation
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false,content: {
            HStack(spacing: 10){
                ForEach(categoriesViewModel.categories){ category in
                    CategoryItemView(category: category, selectedCategory: $selectedCategory, animation: animation)
                }
            }
        })
        .frame(maxWidth: .infinity)
        .onAppear(){
            selectedCategory = categories.first!
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView(selectedCategory: .constant( categories.first!))
    }
}
