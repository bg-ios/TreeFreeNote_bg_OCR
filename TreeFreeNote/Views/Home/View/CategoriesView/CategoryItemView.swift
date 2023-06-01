//
//  CategoryItemView.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 29/05/23.
//

import SwiftUI

struct CategoryItemView: View {
    var title: String
    var isSelected: Bool
    var body: some View {
        Text(title)
            .fontWeight(.medium)
            .foregroundColor(isSelected ? .white :.gray)
            .frame(minWidth: 50)
            .frame(height: 30)
            .padding(.horizontal, 10)
            .background(isSelected ? .green : Color.clear)
            .clipShape(Capsule())
            .overlay(Capsule()
                .stroke(isSelected ? Color.clear : .gray.opacity(0.8), lineWidth: 1))
    }
}

//    .background(isSelected ? (LinearGradient(gradient: Gradient(colors: [.green, .green.opacity(0.7)]), startPoint: .leading, endPoint: .trailing)) : (LinearGradient(gradient: Gradient(colors:[Color.clear])), startPoint: .leading, endPoint: .trailing))


struct CategoryItemView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItemView(title: "All", isSelected: true)
    }
}
