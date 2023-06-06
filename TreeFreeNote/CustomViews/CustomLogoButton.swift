//
//  CustomLogoButton.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 05/06/23.
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



struct RoundButton: ButtonStyle {
 
     var color: Color = .purple
     
     func makeBody(configuration: Configuration) -> some View {
         
         configuration
             .label
             .frame(width: 40, height: 40, alignment: .center)
             .font(Font.system(size: 25, weight: .semibold))
             .foregroundColor(configuration.isPressed ? Color.gray : color)
             .padding(23)
             .background(
                 Circle()
                     .fill(configuration.isPressed ? color : color.opacity(0.25)))
     }
    
//    Button {
//
//                          print ("didTap roundButton")
//
//                      } label: {
//
//                          Text("Ja")
//
//                      }.buttonStyle(RoundButton(color: .green))
 }
