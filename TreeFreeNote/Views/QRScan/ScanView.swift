//
//  ScanView.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 01/07/23.
//

import SwiftUI
import GoogleSignIn

struct ScanView: View {
    @State var scannedPages: [String]
    @Binding var isTabViewShown: Bool
    
    @ObservedObject var documentViewModel : DocumentsViewModel

    let backAction: () -> Void

    var body: some View {
        VStack{
            self.makeScannerView()
        }
        .onAppear{
            isTabViewShown = false
        }
        .onDisappear{
            isTabViewShown.toggle()
            // Dismiss the document scanner view
            // It will remove scanned images from the scannedImages array
            // Clear previous images
            self.scannedPages.removeAll()
        }
        .background(Color.gray)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
    
    private func makeImageControllerScanner()-> ImageScannerControllerViewRepresenter {
        ImageScannerControllerViewRepresenter(documentViewModel: documentViewModel, controller: ImageScannerController(documentViewModel: documentViewModel)) { results in
            print("Scan resultss -- \(results)")
            
            guard let image = results.enhancedScan?.image else { return }
            if let imagePath = DocumentHandler().saveImageToDocumentDirectory(image: image) {
                self.scannedPages.append(imagePath)
            }
            
//                self.backAction()
        } didClickOnScannerCancel: {
            print("cancel")
            self.backAction()
        }
    }
    
    private func makeScannerView()-> DocumentScannerView {
        DocumentScannerView { result in
            switch result {
            case .success(let scannedImages):
//                self.saveImagesToFileDirectory(scannedPages: scannedImages)
                
                self.navigateToFoldersListView(scannedPages: scannedImages)
            case .failure(let error):
                print(error.localizedDescription)
                self.backAction()
            }
        } didCancelScanning: {
            // Dismiss the scanner controller and the sheet.
            self.backAction()
        }
    }
    
    func navigateToFoldersListView(scannedPages: [UIImage]) {
        NavigationLink(destination: EmptyView()) {
            HStack {
                Text("")
            }
        }
    }
    
    private func saveImagesToFileDirectory(scannedPages: [UIImage]) {
        let documentHandler = DocumentHandler()
        let date = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        let dateString = formatter.string(from: date)
        
        for image in scannedPages {
            if let imagePath = documentHandler.saveImageToDocumentDirectory(image: image) {
                let documentModel = Document(title: imagePath, creationDate: dateString, fileFormat: "Png")
                documentViewModel.addDocument(documentModel)
            }
        }
        
    }
    
    
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView(scannedPages: [], isTabViewShown: . constant(false), documentViewModel: DocumentsViewModel(), backAction: {
        })
    }
}
