//
//  RoundedTextField.swift
//  CustomBottomSheet
//
//  Created by Bhargavi on 20/06/23.
//

import SwiftUI

struct RoundedTextField: View {
    @Binding var inputText: String //= ""
    var placeHolder: String

    var body: some View {
        TextField("", text: $inputText)
            .modifier(PlaceholderStyle(showPlaceHolder: inputText.isEmpty,
                            placeholder: placeHolder))
            .foregroundColor(Color.black)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.gray.opacity(0.5), lineWidth: 1)
            )
    }
}

//struct RoundedTextField_Previews: PreviewProvider {
//    static var previews: some View {
//        RoundedTextField(placeHolder: "Enter Name")
//    }
//}
