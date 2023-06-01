//
//  ToolsView.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 29/05/23.
//

import SwiftUI

struct ToolsView: View {
    var body: some View {
        VStack(spacing: 10) {
            HStack{
                Text("Tools")
                    .foregroundColor(.black)
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(10)
                Spacer()
            }
            HStack(spacing: 10, content: {
                ToolsItemView(title: "Merge PDF")
                ToolsItemView(title: "Split PDF")
                ToolsItemView(title: "eSign PDF")
                ToolsItemView(title: "See all")
            })
        }
    }
}

struct ToolsView_Previews: PreviewProvider {
    static var previews: some View {
        ToolsView()
    }
}
