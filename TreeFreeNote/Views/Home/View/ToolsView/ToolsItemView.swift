//
//  ToolsItemView.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 29/05/23.
//

import SwiftUI

struct ToolsItemView: View {
    var title: String
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "circle.grid.2x2")
                .font(.title2)
                .padding(10)
                .background(Color.green.opacity(0.12))
                .foregroundColor(Color.green)
                .clipShape(Circle())
            Text(title)
                .font(Font.subheadline)
                .foregroundColor(.black)
            
        }
        .frame(maxWidth: .infinity)

    }
}

struct ToolsItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToolsItemView(title: "Merge PDF")
    }
}
