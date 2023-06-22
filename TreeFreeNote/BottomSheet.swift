//
//  BottomSheet.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 16/06/23.
//

import SwiftUI

enum BottomSheetType: Int {
    case newTag
    case newFolder
    
    func view() -> AnyView {
        switch self {
        case .newTag, .newFolder:
            return AnyView(TagCreationView())
        }
    }
}

struct BottomSheet: View {

    @Binding var isShowing: Bool
    var content: AnyView
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if (isShowing) {
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing.toggle()
                    }
                content
                    .padding(.bottom, 42)
                    .transition(.move(edge: .bottom))
                    .background(
                        Color(.white)
                    )
                    .cornerRadius(16, corners: [.topLeft, .topRight])
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut, value: isShowing)
    }
}