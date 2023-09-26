//
//  CustomFoldersListCell.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 06/06/23.
//

import SwiftUI

enum StorageType: String, CaseIterable, Identifiable {
    var id: Self { return self }
    
    case Device = "Device"
    case GoogleDrive = "GoogleDrive"
    case OneNote = "OneNote"
    
    static let allValues = [Device, GoogleDrive, OneNote]

    var storageTypeImage: String {
        switch self {
        case .Device:
            return "Device"
        case .GoogleDrive:
            return "driveIcon"
        case .OneNote:
            return "Device"
        }
    }
    
    var folderStorageBg: String {
        switch self {
        case .Device:
            return "DeviceStorageBgIcon"
        case .GoogleDrive:
            return "DriveBgIcon"
        case .OneNote:
            return "DeviceStorageBgIcon"
        }
    }
    
    var folderStorageIcon: String {
        switch self {
        case .Device:
            return "FilesIcon"
        case .GoogleDrive:
            return "driveIcon"
        case .OneNote:
            return "FilesIcon"
        }
    }
}

struct CustomFoldersListCell: View {
    
    var folderInfo: FolderModel
    
    var body: some View {
        VStack {
            ZStack {
                VStack(alignment: .leading, spacing: 2) {
                    folderPropertiesView
                        .padding(.trailing, -10)
                    VStack(alignment: .leading, spacing: 2) {
                        if let folderName = folderInfo.folderName {
                            Text(folderName)
                                .foregroundColor(Color.priaryTextColor)
                                .font(.system(size: 14, weight: .medium))
                                .frame(height: 20)
                        }
                        HStack(spacing: 10) {
                            if let cloudMail = folderInfo.cloudStoreId {
                                Text(cloudMail)
                                    .foregroundColor(Color.descriptionTextColor)
                                    .font(.system(size: 12, weight: .thin))
                                    .fontWeight(.medium)
                            }
                            Spacer()
                                .background(Color.red)
                            if let storageType = folderInfo.storageType {
//                                , let storageTypeIcon = StorageType(rawValue: storageType)?.storageTypeImage {
                                
                                Image(StorageType.GoogleDrive.folderStorageIcon)
                                    .resizable()
                                    .renderingMode(.original)
                                    .frame(width: 18, height: 18)
                            }
                        }
                        .frame(height: 25)
                        .padding(.trailing, 10)

                    }
                }
                .padding(10)
                .background(Color.gray.opacity(0.09))
                .cornerRadius(10)
                .offset(y: 15)
                
                ZStack {
                    if let storageType = folderInfo.storageType {
                        //, let bgIcon = StorageType(rawValue: storageType)?.folderStorageBg, let storageIcon = StorageType(rawValue: storageType)?.folderStorageIcon {
                        Image(StorageType.Device.folderStorageBg) //bgIcon
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 35, height: 35)
                            .foregroundColor(Color.green)
                        Image(StorageType.Device.folderStorageIcon) //storageIcon
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 15, height: 15)
                    }
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
            if let documentCount = folderInfo.documentCount, Int(documentCount) ?? 0 > 0 {
                Text("\(documentCount)")
                    .foregroundColor(Color.secondaryTextColor)
                    .font(.subheadline)
                    .frame(height: 30)
            }
            if let isPinned = folderInfo.pinStatus as? String, Int(isPinned) == 1 {
                CustomLogoButton(imageName: "Pin") {
                    print("pin Icon clicked")
                }
                .frame(width: 30, height: 30)
            }
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
