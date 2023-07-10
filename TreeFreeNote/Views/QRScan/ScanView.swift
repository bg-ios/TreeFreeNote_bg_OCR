//
//  ScanView.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 01/07/23.
//

import SwiftUI

struct ScanView: View {
    @Binding var isTabViewShown: Bool
    let backAction: () -> Void
    
    var body: some View {
        VStack{
            ImageScannerControllerViewRepresenter(controller: ImageScannerController()) { results in
                print("Scan resultss -- \(results)")
                self.backAction()
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
        ScanView(isTabViewShown: . constant(false), backAction: {
        })
    }
}
