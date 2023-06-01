//
//  CategoryItemView.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 29/05/23.
//

import SwiftUI

struct CategoryItemView: View {
    var category: Category
    @Binding var selectedCategory: Category?
    var animation: Namespace.ID
    
    var isSelected: Bool {
        selectedCategory?.id == category.id
    }
    
    var body: some View {
        Button {
            withAnimation(.spring()) {
                selectedCategory = category
            }
        } label: {
            Text(category.title)
                .fontWeight(.medium)
                .foregroundColor(isSelected ? .white :.gray)
                .frame(minWidth: 50)
                .frame(height: 30)
                .padding(.horizontal, 10)
                .background(Color.clear)
                .clipShape(Capsule())
                .overlay(Capsule()
                    .stroke(isSelected ? Color.clear : .gray.opacity(0.8), lineWidth: 1))
                .background(
                //For Slide Animation effect
                    
                    ZStack{
                        if selectedCategory?.id == category.id{
                            Color.green
                                .clipShape(Capsule())
                                .overlay(Capsule()
                                    .stroke(isSelected ? Color.clear : .gray.opacity(0.8), lineWidth: 1))
                                .matchedGeometryEffect(id: "Tab", in: animation)
                        }
                    }
                
                )
            
        }
       
    }
}

//    .background(isSelected ? (LinearGradient(gradient: Gradient(colors: [.green, .green.opacity(0.7)]), startPoint: .leading, endPoint: .trailing)) : (LinearGradient(gradient: Gradient(colors:[Color.clear])), startPoint: .leading, endPoint: .trailing))


//struct CategoryItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryItemView(category: categories.first!, selectedCategory: .constant(categories.first!))
//    }
//}
