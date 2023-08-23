//
//  ScannedImagePreviewView.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 22/08/23.
//

import Foundation
import SwiftUI

struct ScannedImagePreviewView: View {
    let imageNames : [UIImage]
    @State private var currentIndex: Int = 1
    @GestureState private var translation: CGFloat = 0

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        VStack {
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
                CustomLogoButton(imageName: "Back") {
                    self.presentationMode.wrappedValue.dismiss()
                }
                Spacer()
                Text("\(currentIndex) / \(imageNames.count)")
                Spacer()
                CustomLogoButton(imageName: "TickIcon") {
                    self.saveImagesToFileDirectory()
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "didDismissOnSaving"), object: self, userInfo: nil)
                    self.presentationMode.wrappedValue.dismiss()
                    //TODO: Google drive integration
                }
                .foregroundColor(Color.black)
                
            }
            .frame(height: 55)
            .padding()
            .background(Color.white)
            .cornerRadius(25, corners: [.topLeft,.topRight])
        }
        .onAppear {
            UIScrollView.appearance().isPagingEnabled = true
        }
    }
    
    private func saveImagesToFileDirectory() {
        let documentHandler = DocumentHandler()
        let date = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        let dateString = formatter.string(from: date)

    let documentsViewModel = DocumentsViewModel()
        for image in self.imageNames {
            if let imagePath = documentHandler.saveImageToDocumentDirectory(image: image) {
                let documentModel = Document(title: imagePath, creationDate: dateString, fileFormat: "Png")
                documentsViewModel.addDocument(documentModel)
            }
        }
        
    }
}
