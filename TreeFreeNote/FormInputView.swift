//
//  FormInputView.swift
//  CustomBottomSheet
//
//  Created by Bhargavi on 17/06/23.
//

import SwiftUI

struct FormInputView: View {
    @Binding var formInputText: String //= ""
    var fieldName: String
    var fieldPlaceholder: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(fieldName)
                    .font(.title3)
                    .fontWeight(.regular)
                    .foregroundColor(Color.black)
                    .frame(width: 100, alignment: .leading)
                    .padding(.trailing, 16)
                RoundedTextField(inputText: $formInputText, placeHolder: fieldPlaceholder)
                //git test
                
            }
            .frame(height: 35)
        }
        .padding(.horizontal, 27)
    }
}

struct FormInputView_Previews: PreviewProvider {
    static var previews: some View {
        FormInputView(formInputText: .constant("Text"), fieldName: "Name", fieldPlaceholder: "EnterName")
    }
}
