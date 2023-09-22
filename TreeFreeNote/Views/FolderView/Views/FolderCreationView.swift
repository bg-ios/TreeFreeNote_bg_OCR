//
//  FolderCreationView.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 17/06/23.
//

import SwiftUI

struct FolderCreationView: View {
    
    @State var isFolderLockEnabled: Bool = false
    @State private var enableFaceId = false
    @Binding var isShowingBottomSheet: Bool
    
    @State private var folderName: String = ""
    @State private var saveAccount: String = "Device"
    @State private var email: String = ""
    
    var createFolder: ((String) -> ())?

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    isShowingBottomSheet.toggle()
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
                FormInputView(formInputText: $folderName, fieldName: "Name", fieldPlaceholder: "Enter Name")
                FormInputView(formInputText: $saveAccount, fieldName: "Save/Share", fieldPlaceholder: "Select Account")
                FormInputView(formInputText: $email, fieldName: "Email/Phone", fieldPlaceholder: "test@gmail.com")
                LockView(isFolderLockEnabled: $isFolderLockEnabled)
                
                /*
                if isFolderLockEnabled {
                    VStack {
                        HStack(alignment: .top) {
                            Text("Create Pin")
                                .font(.title3)
                                .fontWeight(.regular)
                                .foregroundColor(Color.black)
                            Spacer()
                            PasscodeField("") { digits, action in
//                                if "1234" == digits.concat {
//                                    action(true)
//                                } else {
//                                    action(false)
//                                }
                            }
                            .fixedSize(horizontal: true, vertical: true)
                        }
                        .frame(height: 75)
                        
                        /*
                        HStack {
                            Text("Enable face Id")
                                .font(.title3)
                                .fontWeight(.regular)
                                .foregroundColor(Color.black)
                            Spacer()
                            
                            Toggle("", isOn: $enableFaceId)
                                .toggleStyle(SwitchToggleStyle(tint: .green))
                        }
                        .padding(.top, 8)
                         */
                        
                    }
                    .padding(.horizontal, 27)
                }
                */
                Button (action: {
                    self.createFolderWithInfo()
                    isShowingBottomSheet.toggle()

                }) {
                    Text("Create")
                        .fontWeight(.bold)
                        .padding(10)
                        .foregroundColor(.white)
                        .padding (.horizontal, 120)
                }
                .background(LinearGradient(gradient: Gradient(colors: [Color(UIColor(red: 3/255.0, green: 151/255.0, blue: 41/255.0, alpha: 1)), Color(UIColor(red: 78/255.0, green: 234/255.0, blue: 118/255.0, alpha: 1))]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(20, corners: .allCorners)
                .padding(.top, 30)
            }
        }
        .padding(.bottom, 42)
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
    
    private func createFolderWithInfo() {
        let query = querys()
        let is_exits = query.value_exits(folder_name: self.folderName)
//        var folder_id = ""
        if is_exits {
            //TODO: Show alert folder name exists or continue with existing folder
//            folder_id = query.get_folder_id(folder_name: self.folderName)
                
        } else {
            query.insertFolder(folder_name: self.folderName, parent_folder: "", cloud_storage_id: self.email, storage_type: self.saveAccount)
            
            //TODO: Show Folder creation success alert
//            folder_id = query.get_max_id_table(table_name: DBTableName.folders.rawValue)
        }
        
    }
}

struct FolderCreationView_Previews: PreviewProvider {
    static var previews: some View {
        FolderCreationView( isShowingBottomSheet: .constant(true))
    }
}
