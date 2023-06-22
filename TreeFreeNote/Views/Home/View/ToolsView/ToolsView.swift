//
//  ToolsView.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 29/05/23.
//

import SwiftUI

struct ToolsView: View {
    var body: some View {
        VStack(spacing: 2) {
            HStack{
                Text("Tools")
                    .foregroundColor(.black)
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(4)
                Spacer()
            }
            HStack(spacing: 2) {
                ToolsItemView(title: "Merge PDF")
                ToolsItemView(title: "Split PDF")
                ToolsItemView(title: "eSign PDF")
                ToolsItemView(title: "See all")
            }
        }
    }
}

struct ToolsView_Previews: PreviewProvider {
    static var previews: some View {
        ToolsView()
    }
}
