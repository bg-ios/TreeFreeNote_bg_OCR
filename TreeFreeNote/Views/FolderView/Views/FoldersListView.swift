//
//  FoldersListView.swift
//  TreeFreeNote
//
//  Created by Bhargavi on 21/08/23.
//

import SwiftUI
import GoogleSignIn

struct FoldersListView : View {
    var imageNames = [UIImage]()

    @State var foldersArray: Array<String> = []
    @Binding var isTabViewShown: Bool

    @Binding var isShowingBottomSheet: Bool
    @Binding var bottomSheetContentType: BottomSheetType
    @Binding var isNavigate: Bool
    
    @State var selectedFolderName: String = ""
    @Binding var selectedTab: String
    @ObservedObject var foldersObserver = FoldersObserver.shared
    
    var body: some View {
        VStack {
            ScrollView {
                if !foldersArray.isEmpty {
                    LazyVStack(alignment: .leading, spacing: 10, pinnedViews: .sectionHeaders) {
                        ForEach(foldersArray, id: \.self) { folderName in
                            HStack {
                                
                                Text(folderName)
                                    .font(.subheadline)
                                    .foregroundColor(Color.black)
                                    .padding(8)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Spacer()
                                if self.selectedFolderName == folderName {
                                    Image(systemName: "checkmark.circle.fill")//"checkmark")
                                        .foregroundColor(.green)
                                        .padding(.trailing, 10)
                                }
                                
                            }
                            .padding(.horizontal, 10)
                            .onTapGesture {
                                self.selectedFolderName = folderName
                            }
                            
                            Divider()
                        }
                    }
                }
                Spacer()
                HStack {
                    
                    Button (action: {
                        bottomSheetContentType = .newFolder
                        isShowingBottomSheet.toggle()
                        
                        //TODO: create Folder and get folderId
                    }) {
                        Text("Create Folder")
                            .fontWeight(.bold)
                            .padding(10)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                    }
                    .background(LinearGradient(gradient: Gradient(colors: [Color(UIColor(red: 3/255.0, green: 151/255.0, blue: 41/255.0, alpha: 1)), Color(UIColor(red: 78/255.0, green: 234/255.0, blue: 118/255.0, alpha: 1))]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(20, corners: .allCorners)
                    .padding(.vertical, 30)
                    .padding(.horizontal, 10)
                    
                    
                    Button (action: {
                        if !selectedFolderName.isEmpty {
                            self.saveImageToDocumentDictory()
                            TestObservers.shared.isDocumentSaved = true

                        }
                        //TODO: Navigate to home tab after saving
                        self.isNavigate = false
//                        TestObservers.shared.isScannedDocUpdated = true
                        selectedTab = "Home"

                    }) {
                        Text("Save Here")
                            .fontWeight(.bold)
                            .padding(10)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                    }
                    .background(LinearGradient(gradient: Gradient(colors: [Color(UIColor(red: 3/255.0, green: 151/255.0, blue: 41/255.0, alpha: 1)), Color(UIColor(red: 78/255.0, green: 234/255.0, blue: 118/255.0, alpha: 1))]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(20, corners: .allCorners)
                    .padding(.vertical, 30)
                    .padding(.horizontal, 10)
                    
                    
                }
                .padding(.bottom, 10)
            }
        }
        .onChange(of: foldersObserver.isFolderCreated, perform: { newValue in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                getFoldersData()
                foldersObserver.isFolderCreated = false
            }
        })
        .onAppear{
            isTabViewShown = false
            getFoldersData()
            
        }
        .onDisappear{
            isTabViewShown.toggle()
        }
    }
    
    func getFoldersData() {
        let foldersList = querys().get_value_of_tabel(tableName: DBTableName.folders.rawValue)
        
        for folder in foldersList {
            if let folderName = folder["folder_name"] as? String {
                foldersArray.append(folderName)
            }
        }
    }
    
    func saveImageToDocumentDictory() {
        let documentHandler = DocumentHandler()
        let queries = querys()
        let folderId = queries.get_folder_id(folder_name: selectedFolderName)
        let folderInfo =
        queries.insertDocuments(title: "Maths", documentType: "jpeg", linkedTagId: "", security: "", storage_type: "Device", folderId: folderId)
        
        let documentId = queries.get_max_id_table(table_name: DBTableName.documents.rawValue)
        
        var imageDirectoryPaths = Array<String>()
        for image in imageNames {
            if let imagePath = documentHandler.saveImageToDocumentDirectory(selectedFolder: selectedFolderName, image: image) {
                imageDirectoryPaths.append(imagePath)
            }
        }
        queries.insertPages(documentId: documentId, filesPathArray: imageDirectoryPaths)
        
        if let userArray = AppPersistenceUtility.getObjectFromUserDefaults(key: "GoogleDriveUsers") as? Dictionary<String, Any>, let userInfo = userArray["treefreenote3@gmail.com"] as? GIDGoogleUser {
            ColudSyncModel().uploadScannedImagesToGoogleDrive(user: userInfo, imagePaths: imageDirectoryPaths, folderName: "Education")
            
        }

    }
    
    
    
}

//struct FoldersListView_Previews: PreviewProvider {
//    static var previews: some View {
//        FoldersListView(foldersArray: ["Document", "Personal"], isTabViewShown: .constant(true))
//    }
//}



class FoldersObserver: ObservableObject {

    static var shared = FoldersObserver()
    
    @Published var isFolderCreated: Bool = false
    
    
}