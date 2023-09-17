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
                FormInputView(fieldName: "Name", fieldPlaceholder: "Enter Name")
                FormInputView(fieldName: "Save/Share", fieldPlaceholder: "Select Account")
                FormInputView(fieldName: "Email/Phone", fieldPlaceholder: "test@gmail.com")
                LockView(isFolderLockEnabled: $isFolderLockEnabled)
                
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
                
                Button (action: { print("create Folder pressed!!") }) {
                    Text("Create")
                        .fontWeight(.bold)
                        .padding(10)
                        .foregroundColor(.white)
                        .padding (.horizontal, 120)
                }
                .background(LinearGradient(gradient: Gradient(colors: [Color(UIColor(red: 3/255.0, green: 151/255.0, blue: 41/255.0, alpha: 1)), Color(UIColor(red: 78/255.0, green: 234/255.0, blue: 118/255.0, alpha: 1))]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(20, corners: [.topRight,.topLeft, .bottomLeft, .bottomRight])
                .padding(.top, 30)
            }
        }
        .padding(.bottom, 42)
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

struct FolderCreationView_Previews: PreviewProvider {
    static var previews: some View {
        FolderCreationView( isShowingBottomSheet: .constant(true))
    }
}
