//
//  ScannedImagePreviewView.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 22/08/23.
//

import Foundation
import SwiftUI

struct ScannedImagePreviewView: View {
    var imageNames = [UIImage]()
    var isFromScanner: Bool = false

    @Binding var isShowingBottomSheet: Bool
    @Binding var bottomSheetContentType: BottomSheetType

    
    @Binding var isTabViewShown: Bool

    @State private var documentName: String = ""

    @State private var currentIndex: Int = 1
    @GestureState private var translation: CGFloat = 0

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @ObservedObject var documentsViewModel: DocumentsViewModel

    var body: some View {
        VStack {
            if isFromScanner {
                VStack {
                    TextField("Enter Document Name", text: $documentName)
                        .padding(12)
                        .padding (.leading, -10)
                        .padding(.leading, -3)
                }
            }
            
            GeometryReader { proxy in
                ScrollView(.horizontal) {
                    HStack(spacing: 0) {
                        ForEach(imageNames, id: \.self) { image in
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: proxy.size.height)
                                
                        }
                        .frame(width: proxy.size.width, height: proxy.size.height - 2)
                    }

                }
                .gesture(
                    DragGesture().updating(self.$translation) { value, state, _ in
                        state = value.translation.width
                    }.onEnded { value in
                        let offset = value.translation.width / proxy.size.width
                        let newIndex = (CGFloat(self.currentIndex) - offset).rounded()
                        self.currentIndex = min(max(Int(newIndex), 0), self.imageNames.count - 1)
                    }
                )
                
            }
            .background(Color.clear)
            HStack {
                if isFromScanner {
//                    CustomLogoButton(imageName: "Back") {
//                        self.presentationMode.wrappedValue.dismiss()
//                    }
                }
                
                Spacer()
                Text("\(currentIndex) / \(imageNames.count)")
                Spacer()
                
                
                if isFromScanner {
                    
                    NavigationLink {
                        FoldersListView(imageNames: imageNames, foldersArray: [], isTabViewShown: $isTabViewShown, isShowingBottomSheet: $isShowingBottomSheet, bottomSheetContentType: $bottomSheetContentType, selectedFolderName: "")
                    } label: {
                        Text("Next")
                            .foregroundColor(Color.black)
                            .fontWeight(.medium)
                    }
                    

//                    CustomLogoButton(imageName: "TickIcon") {
//
//                        self.saveImagesToFileDirectory()
//                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "didDismissOnSaving"), object: self, userInfo: nil)
//                        self.presentationMode.wrappedValue.dismiss()
//                        //TODO: Google drive integration
//                    }
//                    .foregroundColor(Color.black)
                }
            }
            .frame(height: 55)
            .padding()
            .background(Color.clear)
            .cornerRadius(25, corners: [.topLeft,.topRight])
        }
        .onAppear {
            UIScrollView.appearance().isPagingEnabled = true
            isTabViewShown = true
        }
        .onDisappear{
            isTabViewShown.toggle()
        }
    }
    
    private func saveImagesToFileDirectory() {
        let documentHandler = DocumentHandler()
        let date = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        let dateString = formatter.string(from: date)
        
        for image in self.imageNames {
            if let imagePath = documentHandler.saveImageToDocumentDirectory(selectedFolder: "", image: image) {
                let documentModel = Document(title: imagePath, creationDate: dateString, fileFormat: "Png")
                documentsViewModel.addDocument(documentModel)
            }
        }
        
    }
}
