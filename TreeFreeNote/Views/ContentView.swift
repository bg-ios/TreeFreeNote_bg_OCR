//
//  ContentView.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 30/05/23.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    init() {
        UITabBar.appearance().isHidden = true
    }

    //Selected Category
    @State private var selectedItem: Category?
    //Selected Tab
    @State var selectedTab: String = "Home"
    
    @State var bottomSheetContentType: BottomSheetType = .newTag
    @State var isShowingBottomSheet: Bool = false
    
    @State var isTabViewShown = true
    @Environment(\.presentationMode) private var presentationMode

    var body: some View {
        NavigationView {
            ZStack {
                //TabView
                VStack(spacing: 0) {
                    TabView(selection: $selectedTab) {
                        NavigationView {
                            Home(selectedCategory: $selectedItem, bottomSheetContentType: $bottomSheetContentType, isShowingBottomSheet: $isShowingBottomSheet)
                        }
                        .tag("Home")
                        
                        NavigationLink(destination: Text("QR Scan View")) {
                            ScanView(isTabViewShown: $isTabViewShown) {
                                self.selectedTab = "Home"
                            }
                        }
                        .tag("QR Scan")
                        
                        NavigationLink(destination: Text(" Scan View")) {
                            ScanView(isTabViewShown: $isTabViewShown) {
                                self.selectedTab = "Camera"
                            }
                        }
                        .tag("Camera")
                        
                        NavigationLink(destination: Text("OCR Scan View")) {
                            ScanView(isTabViewShown: $isTabViewShown) {
                                self.selectedTab = "Home"
                            }
                        }
                        .tag("OCR Scan")
                        
                        NavigationLink(destination: Text("Import View")) {
                            Color.gray
                        }
                        .tag("Import")
                    }
                    .accentColor(.blue)
                    
                    // Custom Tab View
                    if isTabViewShown {
                        CustomTabbar(selectedTab: $selectedTab, action: {
                            // Optional: Perform any additional actions when a tab is selected
//                            NavigationLink(destination: Text("Camera View")) {
//                                ScanView(isTabViewShown: $isTabViewShown) {
//                                    self.selectedTab = "Home"
//                                }
//                            }
                        })
                    }
                }
                .ignoresSafeArea()
                
                BottomSheet(isShowing: $isShowingBottomSheet, content: bottomSheetContentType.view())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}

//struct CornerRadiusStyle: ViewModifier {
//    var radius: CGFloat
//    var corners: UIRectCorner
//
//    struct CornerRadiusShape: Shape {
//
//        var radius = CGFloat.infinity
//        var corners = UIRectCorner.allCorners
//
//        func path(in rect: CGRect) -> Path {
//            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
//            return Path(path.cgPath)
//        }
//    }
//
//    func body(content: Content) -> some View {
//        content
//            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
//    }
//}
