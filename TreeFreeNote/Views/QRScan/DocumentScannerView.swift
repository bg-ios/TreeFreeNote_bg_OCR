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
    var didFinishScanning: ((_ result: Result<[UIImage], Error>) -> Void)
    var didCancelScanning: () -> Void
    
    func makeUIViewController(context: Context) -> VNDocumentCameraViewController {
        let scannerViewController = VNDocumentCameraViewController()
        scannerViewController.delegate = context.coordinator
        return scannerViewController
    }
    
    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context) { }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(with: self)
    }
    
    class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
        let scannerView: DocumentScannerView
        
        init(with scannerView: DocumentScannerView) {
            self.scannerView = scannerView
        }
        
        // MARK: - VNDocumentCameraViewControllerDelegate
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            var scannedPages = [UIImage]()
            
            for i in 0..<scan.pageCount {
                scannedPages.append(scan.imageOfPage(at: i))
            }
            
            scannerView.didFinishScanning(.success(scannedPages))
            controller.dismiss(animated: true, completion: nil)

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
