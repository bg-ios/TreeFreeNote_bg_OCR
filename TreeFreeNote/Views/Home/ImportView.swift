//
//  ImportView.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 05/10/23.
//

import SwiftUI

struct ImportView: View {
    @State private var selectedImportImages: [UIImage] = []

    @Binding var isTabViewShown: Bool
    @Binding var isShowingBottomSheet: Bool
    @Binding var selectedTab: String
    @Binding var bottomSheetContentType: BottomSheetType
    
    @State var isNavigated: Bool = false
    @ObservedObject var documentViewModel : DocumentsViewModel
    @State var isSelectedImages: Bool = false

    
    var body: some View {
        NavigationView {
            VStack {
                PhotoPickerView(selectedImages: $selectedImportImages) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
                        if selectedImportImages.count > 0 {
                            isSelectedImages.toggle()
                        } else {
                            selectedTab = "Home"
                        }
                    })
                }
                .background(
                    NavigationLink(destination: ScannedImagePreviewView(imageNames: selectedImportImages , isFromScanner: true, isShowingBottomSheet: $isShowingBottomSheet, bottomSheetContentType: $bottomSheetContentType, isNavigated: .constant(false), selectedTab: $selectedTab, isTabViewShown: $isShowingBottomSheet, documentsViewModel: documentViewModel), isActive: $isSelectedImages) {
                        EmptyView()      // << hidden !!
                    })

            }
            .navigationBarHidden(true)
            .navigationBarTitleDisplayMode(.inline)

        }
        .onAppear{
            isTabViewShown = false
            isSelectedImages = false
            selectedImportImages = []
        }
        .onDisappear{
            isTabViewShown.toggle()
            isSelectedImages = false
            selectedImportImages.removeAll()
        }

    }
    
}
