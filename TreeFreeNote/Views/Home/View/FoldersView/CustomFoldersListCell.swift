//
//  CustomFoldersListCell.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 06/06/23.
//

import SwiftUI

struct CustomFoldersListCell: View {
//    @Binding var filesCount: String
    
    @Binding var folderInfo: Dictionary<String, Any>
    
    var body: some View {
        VStack {
            ZStack {
                VStack(alignment: .leading, spacing: 2) {
                    folderPropertiesView
                        .padding(.trailing, -10)
                    VStack(alignment: .leading, spacing: 2) {
                        if let folderName = folderInfo["folder_name"] {
                            Text("folderName")
                                .foregroundColor(Color.priaryTextColor)
                                .font(.system(size: 14, weight: .medium))
                                .frame(height: 20)
                        }
                        HStack(spacing: 10) {
                            if let cloudMail = folderInfo["cloud_storage_id"] {
                                Text("cloud mail details")
                                    .foregroundColor(Color.descriptionTextColor)
                                    .font(.system(size: 12, weight: .thin))
                                    .fontWeight(.medium)
                            }
                            Spacer()
                                .background(Color.red)
                            if let cloudMail = folderInfo["cloud_storage_id"] {
                                Image("driveIcon")
                                    .resizable()
                                    .renderingMode(.original)
                                    .frame(width: 20, height: 20)
                                    .padding(.trailing, 10)
                            }
                        }
                        .frame(height: 25)
                    }
                }
                .padding(10)
                .background(Color.gray.opacity(0.09))
                .cornerRadius(10)
                .offset(y: 15)
                
                ZStack {
                    Image("FolderBgIcon")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 35, height: 35)
                        .foregroundColor(Color.green)
                    Image("driveIcon")
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 15, height: 15)
                }
                .frame(width: 35, height: 35)
                .offset(x:-70, y: -35)
                
            }
        }
        .listRowBackground(Color.clear)
        .frame(width: 200, height: 120)
    }
}
extension CustomFoldersListCell {
    var folderPropertiesView: some View {
        HStack(spacing: 5) {
            Spacer()
            Text("2")
                .foregroundColor(Color.secondaryTextColor)
                .font(.title3)
                .frame(height: 30)
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
//struct CustomFoldersListCell_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomFoldersListCell(filesCount: .constant(""))
//    }
//}
