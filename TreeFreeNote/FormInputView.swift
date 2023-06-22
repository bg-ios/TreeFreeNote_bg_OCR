//
//  FormInputView.swift
//  CustomBottomSheet
//
//  Created by Bhargavi on 17/06/23.
//

import SwiftUI

struct FormInputView: View {
    @State private var formInputText: String = ""
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
                RoundedTextField(placeHolder: fieldPlaceholder)
                
            }
            .frame(height: 35)
        }
        .padding(.horizontal, 27)
    }
}

struct FormInputView_Previews: PreviewProvider {
    static var previews: some View {
        FormInputView(fieldName: "Name", fieldPlaceholder: "EnterName")
    }
}
