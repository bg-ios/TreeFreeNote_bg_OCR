//
//  FolderCreationView.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 17/06/23.
//

import SwiftUI

struct FolderCreationView: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "xmark.circle")
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 35, height: 35)
                        .foregroundColor(Color.gray)
                        .padding(.horizontal, 10)
                }
            }
            .padding(.bottom, -10)
            
            HStack(alignment: .center, spacing: 2) {
                Image(systemName: "tag.fill")
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 35, height: 35)
                Text("New Folder")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(Color.black)
            }
            .padding(.bottom, 10)
            

            VStack(spacing: 15) {
                FormInputView(fieldName: "Name", fieldPlaceholder: "Enter Name")
                FormInputView(fieldName: "Save/Share", fieldPlaceholder: "Select Account")
                FormInputView(fieldName: "Email/Phone", fieldPlaceholder: "test@gmail.com")
            }
        }
    }
}

struct FolderCreationView_Previews: PreviewProvider {
    static var previews: some View {
        FolderCreationView()
    }
}
