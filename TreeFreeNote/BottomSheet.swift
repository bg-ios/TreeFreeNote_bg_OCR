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
    case folderConfirmationView
    case eraseAlertView
    
    func view() -> AnyView {
        switch self {
        case .newTag:
            return AnyView(TagCreationView(isShowingBottomSheet: .constant(false), createTag: { newTag in
                print(newTag)
                }))
        case .newFolder:
            return AnyView(FolderCreationView())
        case .folderConfirmationView:
            return AnyView(FolderConfirmationView(alertType: .confirmationAlert))
        case .eraseAlertView:
            return AnyView(FolderConfirmationView(alertType: .eraseAlert))
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
                    .cornerRadius(36, corners: [.topLeft, .topRight])
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut, value: isShowing)
    }
}
