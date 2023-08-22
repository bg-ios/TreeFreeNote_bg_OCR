//
//  ScannedImagePreviewView.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 22/08/23.
//

import Foundation
import SwiftUI

struct ScannedImagePreviewView: View {
    let imageNames : [String]
    @State private var currentIndex: Int = 1
    @GestureState private var translation: CGFloat = 0

    var body: some View {
        VStack {
            GeometryReader { proxy in
                ScrollView(.horizontal) {
                    HStack(spacing: 0) {
                        ForEach(imageNames, id: \.self) { imageName in
                            Image(imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(height: proxy.size.height)
                                
                        }
                        .frame(width: proxy.size.width, height: proxy.size.height - 10)
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
            .background(Color.red)
            HStack {
                Button("Back") {
                }
                Spacer()
                Text("\(currentIndex) / \(imageNames.count)")
                Spacer()
                Button("Next") {
                }
            }
            .padding()
        }
        .onAppear {
            UIScrollView.appearance().isPagingEnabled = true
        }
    }
}
