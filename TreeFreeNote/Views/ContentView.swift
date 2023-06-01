//
//  ContentView.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 30/05/23.
//

import SwiftUI
struct ContentView: View {
    
    init() {
        UITabBar.appearance().isHidden = true
    }

    //Selected Category
    @State private var selectedItem: Category?
    //Selected Tab
    @State var selectedTab: String = "Home"
    
    var body: some View {
        //TabView
        VStack(spacing: 0) {
            TabView{
                Home(selectedCategory: $selectedItem)
                    .tag("Home")
                
                Color.red
                    .tag("QR Scan")
                
                Color.orange
                    .tag("OCR Scan")
                
                Color.gray
                    .tag("Import")
            }
            // Custom Tab View
         CustomTabbar(selectedTab: $selectedTab)
//                .cornerRadius(40, corners: [.topLeft, .topRight])
        }
        .ignoresSafeArea()
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

struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner
    
    struct CornerRadiusShape: Shape {

        var radius = CGFloat.infinity
        var corners = UIRectCorner.allCorners

        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    }

    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}
