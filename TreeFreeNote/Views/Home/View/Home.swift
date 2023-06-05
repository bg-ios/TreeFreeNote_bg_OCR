//
//  Home.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 29/05/23.
//

import SwiftUI

struct Home: View {
    //Selected Category..
//    @State var selectedItem: Category?
    @Binding var selectedCategory: Category?
    
    var body: some View {
        
        VStack{
            //NavigationHeaderView
            NavigationHeaderView()
                .padding()
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 15, content: {
                    
                    //ToolsView..
                    ToolsView()
                    
                    //Categories View
                    Spacer(minLength: 10)
                    CategoriesView(selectedCategory: $selectedCategory)
                        .padding(.horizontal, 5)
                    
                    //Documents ListView
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack{
                            ForEach(documentModelSamples){ document in
                             DocumentListCell(document: document)
                                    .frame(height: 120)
                                    .onTapGesture {
                                        print("cell Action")
                                    }
                             Divider()
                                        
                            }
                        }
                    }
                })
            }
        }
        //Light BG Color..
        .background(Color.white.ignoresSafeArea())
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home( selectedCategory: .constant(categories.first!))
    }
}
