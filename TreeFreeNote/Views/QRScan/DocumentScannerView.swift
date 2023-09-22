//
//  DocumentScannerView.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 11/09/23.
//

import SwiftUI
import Vision
import VisionKit

struct DocumentScannerView: UIViewControllerRepresentable {
    var documentViewModel : DocumentsViewModel
    @Binding var isTabViewShown : Bool
    @Binding var isShowingBottomSheet: Bool
    @Binding var bottomSheetContentType: BottomSheetType

    var didFinishScanning: ((_ result: Result<[UIImage], Error>) -> Void)
    var didCancelScanning: () -> Void
    
    func makeUIViewController(context: Context) -> VNDocumentCameraViewController {
        let scannerViewController = VNDocumentCameraViewController()
        scannerViewController.delegate = context.coordinator
        return scannerViewController
    }
    
    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context) { }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(with: self, documentModel: documentViewModel, isTabViewShown: $isTabViewShown, isShowingBottomSheet: $isShowingBottomSheet, bottomSheetContentType: $bottomSheetContentType)
    }
    
    class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
        var scannerView: DocumentScannerView
        var documentViewModel : DocumentsViewModel
        @Binding var isTabViewShown : Bool
        @Binding var isShowingBottomSheet: Bool
        @Binding var bottomSheetContentType: BottomSheetType

        init(with scannerView: DocumentScannerView, documentModel: DocumentsViewModel, isTabViewShown: Binding<Bool>, isShowingBottomSheet: Binding<Bool>, bottomSheetContentType: Binding<BottomSheetType>) {
            self.scannerView = scannerView
            self.documentViewModel = documentModel
            self._isTabViewShown = isTabViewShown
            self._isShowingBottomSheet = isShowingBottomSheet
            self._bottomSheetContentType = bottomSheetContentType
        }
        
        // MARK: - VNDocumentCameraViewControllerDelegate
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            var scannedPages = [UIImage]()
            
            for i in 0..<scan.pageCount {
                scannedPages.append(scan.imageOfPage(at: i))
            }
            
            scannerView.didFinishScanning(.success(scannedPages))
//            controller.dismiss(animated: true, completion: nil)
            
            let previewView = ScannedImagePreviewView(imageNames: scannedPages, isFromScanner: true, isShowingBottomSheet: $isTabViewShown, bottomSheetContentType: $bottomSheetContentType, isTabViewShown: $isShowingBottomSheet, documentsViewModel: self.documentViewModel)
            
//            let previewController = FoldersListView(foldersArray: ["Personal", "Business"], isTabViewShown: .constant(true))
            let previewHostingController = UIHostingController(rootView: previewView)
            
            controller.parent?.navigationController?.pushViewController(previewHostingController, animated: true)

        }
        
        func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
            scannerView.didCancelScanning()
            controller.dismiss(animated: true, completion: nil)
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
            scannerView.didFinishScanning(.failure(error))
            controller.dismiss(animated: true, completion: nil)

        }
    }
}
