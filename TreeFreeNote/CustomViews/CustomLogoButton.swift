//
//  CustomLogoButton.swift
//  TreeFreeNote
//
//  Created by Baby on 05/06/23.
//

import SwiftUI

struct CustomLogoButton: View {
    var imageName: String
    var didClickOnLogoButton: () -> Void

    var body: some View {
        Button(action: {
            didClickOnLogoButton()
        }) {
            Image(imageName)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .padding(5)
                .background(Color.clear)
                .foregroundColor(Color.iconForegroundColor)
        }
        .frame(width: 35, height: 35)
    }
}

struct CustomLogoButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomLogoButton(imageName: "profile", didClickOnLogoButton:
                            {
//            print("Tap Action")
        })
    }
}
