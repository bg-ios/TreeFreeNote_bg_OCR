//
//  CustomFoldersListCell.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 06/06/23.
//

import SwiftUI

struct CustomFoldersListCell: View {
    @Binding var filesCount: String
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                folderPropertiesView
                    .padding(.trailing, -10)
                VStack(alignment: .leading) {
                    Text("Folder Name")
                        .foregroundColor(Color.priaryTextColor)
                        .font(.system(size: 14, weight: .medium))
                        .frame(height: 20)
                    HStack(spacing: 15) {
                        Text("cloud mail details")
                            .foregroundColor(Color.descriptionTextColor)
                            .font(.system(size: 12, weight: .thin))
                            .fontWeight(.medium)
                        Image("driveIcon")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 20, height: 20)
                    }
                }
            }
            .padding()
            .background(Color.gray.opacity(0.09))
            .cornerRadius(10)
            .offset(y: 20)
            Image("tagIcon")
                .resizable()
                .renderingMode(.template)
                .frame(width: 30, height: 30)
                .offset(x:10, y: -120)
            
        }
        .listRowBackground(Color.clear)
        .frame(width: 200, height: 140)
    }
}
extension CustomFoldersListCell {
    var folderPropertiesView: some View {
        HStack {
            Spacer()
            Text("2")
                .foregroundColor(Color.secondaryTextColor)
            CustomLogoButton(imageName: "tagIcon") {
                print("pin Icon clicked")
            }
            .frame(width: 30, height: 30)
            
            CustomLogoButton(imageName: "moreIcon") {
                print("more Icon clicked")
            }
            .frame(width: 30, height: 30)
        }
    }
    
}
struct CustomFoldersListCell_Previews: PreviewProvider {
    static var previews: some View {
        CustomFoldersListCell(filesCount: .constant(""))
    }
}
