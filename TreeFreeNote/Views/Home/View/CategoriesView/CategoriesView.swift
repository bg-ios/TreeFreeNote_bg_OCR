//
//  CategoriesView.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 29/05/23.
//

import SwiftUI

struct CategoriesView: View {
    @Binding var selectedCategory: Category?
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false,content: {
            HStack(spacing: 10){
                ForEach(categories){ category in
                    CategoryItemView(title: category.title,
                                     isSelected: (selectedCategory?.id == category.id))
                    .onTapGesture {
                        withAnimation(.spring()) {
                            selectedCategory = category
                        }
                    }
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
