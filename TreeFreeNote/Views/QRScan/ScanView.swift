//
//  ScanView.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 01/07/23.
//

import SwiftUI

struct ScanView: View {
    @State var scannedPages: [String]
    @Binding var isTabViewShown: Bool
    let backAction: () -> Void
    
    var body: some View {
        VStack{
            ImageScannerControllerViewRepresenter(controller: ImageScannerController()) { results in
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
        .onAppear{
            isTabViewShown = false
        }
        .onDisappear{
            isTabViewShown.toggle()
        }
        .background(Color.gray)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView(scannedPages: [], isTabViewShown: . constant(false), backAction: {
        })
    }
}
