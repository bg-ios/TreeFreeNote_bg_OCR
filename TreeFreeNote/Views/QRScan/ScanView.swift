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
            HStack{
                Button {
                    print("tap on camera")
                    backAction()
                } label: {
                    Text("Back")
                        .frame(height: 40)
                        .padding(16)
                }
                Spacer()
            }
            .background(Color.gray.opacity(0.7))
            Spacer()

        }
        .onAppear {
            isTabViewShown = false
        }
        .onDisappear{
            isTabViewShown.toggle()
        }
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView(isTabViewShown: . constant(false), backAction: {
        })
    }
}
