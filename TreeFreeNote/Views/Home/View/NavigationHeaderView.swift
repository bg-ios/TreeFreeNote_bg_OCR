//
//  NavigationHeaderView.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 29/05/23.
//

import SwiftUI

struct NavigationHeaderView: View {
    var body: some View {
        HStack {
            Button(action: {}) {
                Image(systemName: "circle.grid.2x2")
                    .font(.title2)
                    .padding(10)
                    .background(Color.green.opacity(0.12))
                    .foregroundColor(Color.green)
                    .cornerRadius(8)
            }
            
            Spacer()
            
            Button(action: {}) {
                Image(systemName: "circle.grid.2x2")
                    .font(.title2)
                    .padding(10)
                    .background(Color.green.opacity(0.12))
                    .foregroundColor(Color.green)
                    .cornerRadius(8)
            }
            
            Button(action: {}) {
                Image(systemName: "circle.grid.2x2")
                    .font(.title2)
                    .padding(10)
                    .background(Color.green.opacity(0.12))
                    .foregroundColor(Color.green)
                    .cornerRadius(8)
            }
            Button(action: {}) {
                Image(systemName: "circle.grid.2x2")
                    .font(.title2)
                    .padding(10)
                    .background(Color.green.opacity(0.12))
                    .foregroundColor(Color.green)
                    .cornerRadius(8)
            }
            
            Button(action: {}) {
                Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .padding(10)
                    .background(Color.black.opacity(0.08))
                    .foregroundColor(Color.green)
                    .clipShape(Circle())
//                    .padding(.trailing,5)
                
            }
            
            
        }
    }
}

struct NavigationHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationHeaderView()
    }
}
