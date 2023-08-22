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
    
    @State var categoriesViewModel = CategoriesViewModel()
    
    var body: some View {
        ZStack {
            //TabView
            VStack(spacing: 0) {
                TabView(selection: $selectedTab) {
                    Home(selectedCategory: $selectedItem, bottomSheetContentType: $bottomSheetContentType, isShowingBottomSheet: $isShowingBottomSheet, categoriesViewModel: categoriesViewModel)
                        .tag("Home")
                    
                    ScanView(scannedPages: [], isTabViewShown: $isTabViewShown) {
                        self.selectedTab = "Home"
                    }
                    .tag("QR Scan")
                    
                    ScanView(scannedPages: [], isTabViewShown: $isTabViewShown) {
                        self.selectedTab = "Camera"
                    }
                    .tag("Camera")
                    
                    ScanView(scannedPages: [], isTabViewShown: $isTabViewShown) {
                        self.selectedTab = "Home"
                    }
                    .tag("OCR Scan")
                    
                    Color.gray
                        .tag("Import")
                }
                
                // Custom Tab View
                if isTabViewShown {
                    CustomTabbar(selectedTab: $selectedTab, action: {
                        // Optional: Perform any additional actions when a tab is selected
                    })
                }
            }
            .ignoresSafeArea()
            
            BottomSheet(isShowingBottomSheet: $isShowingBottomSheet, content: self.createBottomSheetContentView())
        }
    }
}

extension ContentView {
    
    func createBottomSheetContentView() -> AnyView {
        switch bottomSheetContentType {
        case .newTag:
            return AnyView(TagCreationView(isShowingBottomSheet: $isShowingBottomSheet, createTag: { newTag in
                print(newTag)
            }, categoriesViewModel: categoriesViewModel))
        case .newFolder:
            return AnyView(FolderCreationView())
        case .folderConfirmationView:
            return AnyView(FolderConfirmationView(alertType: .confirmationAlert))
        case .eraseAlertView:
            return AnyView(FolderConfirmationView(alertType: .eraseAlert))
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
