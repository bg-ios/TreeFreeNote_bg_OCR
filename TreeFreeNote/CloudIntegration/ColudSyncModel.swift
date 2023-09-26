//
//  ColudSyncModel.swift
//  TreeFreeNote
//
//  Created by Baby on 23/09/23.
//

import UIKit
import GoogleSignIn
import GoogleAPIClientForREST
import GTMSessionFetcher
import GLKit

class ColudSyncModel : NSObject {
 
    func uploadScannedImagesToGoogleDrive(user: GIDGoogleUser, imagePaths: [String], folderName: String) {
        let googleDriveService = GTLRDriveService()
        
        googleDriveService.authorizer = user.fetcherAuthorizer
        
        for path in imagePaths {
            
            let filePath : String =  path
            
            let file = GTLRDrive_File()
            file.name = URL(string: filePath)?.lastPathComponent
//            file.parents = [folderName]
            if let fileUrl = URL(string: "file://" + filePath) {
                // Optionally, GTLRUploadParameters can also be created with a Data object.
                let uploadParameters = GTLRUploadParameters(fileURL: fileUrl, mimeType: "image/jpeg")
                
                let query = GTLRDriveQuery_FilesCreate.query(withObject: file, uploadParameters: uploadParameters)
                
                googleDriveService.uploadProgressBlock = { _, totalBytesUploaded, totalBytesExpectedToUpload in
                    // This block is called multiple times during upload and can
                    // be used to update a progress indicator visible to the user.
                    //TODO: Show loading indicator at upload time
                }
                
                googleDriveService.executeQuery(query) { (_, result, error) in
                    guard error == nil else {
                        fatalError(error!.localizedDescription)
                    }
                    
                    // Successful upload if no error is returned.
                    print(result)
                }
            }
            
        }
    }
 
//    func checkGoogleFolderAvailability() {
//        getFolderID(name: name as String, service: googleDriveService, user: user, completion: {(status) in
//            
//            if status != nil{
//                
//                print(String(status!),"folder ID")
//                
//                self.parent_folderID = status!
//                
//                self.uploadFileInfolder(folderName: name as String, filevalue: filepath, user: user)
//                
//            }else{
//                
//                self.createFolder(name: name as String, service: googleDriveService, completion: {(status) in
//                    
//                    print(status)
//                    
//                    print(String(status),"folder created ID")
//                    
//                    self.parent_folderID = status
//                    
//                    self.uploadFileInfolder(folderName: name as String, filevalue: filepath, user: user)
//                    
//                })
//                
//            }
//            
//        })
//    }
 
    func getFolderID(

        name: String,
        
        service: GTLRDriveService,
        
        user: GIDGoogleUser,
        
        completion: @escaping (String?) -> Void) {
            
            
            
            let query = GTLRDriveQuery_FilesList.query()
            
            // Comma-separated list of areas the search applies to. E.g., appDataFolder, photos, drive.
            
            query.spaces = "drive"
            
            // Comma-separated list of access levels to search in. Some possible values are "user,allTeamDrives" or "user"
            
            query.corpora = "user"
            
            let withName = "name = '\(name)'" // Case insensitive!
            
            let foldersOnly = "mimeType = 'application/vnd.google-apps.folder'"
            
            let ownedByUser = "'\(user.profile!.email)' in owners"
            
            query.q = "\(withName) and \(foldersOnly) and \(ownedByUser)"
            
            
            
            service.executeQuery(query) { (_, result, error) in
                
                if error != nil {
                    
                    print(error as Any)
                    
                    completion(nil)
                    
                    return
                    
                }
                
                
                
                let folderList : GTLRDrive_FileList  = result as! GTLRDrive_FileList
                
                
                
                if folderList.files?.first?.identifier == nil{
                    
                    completion(nil)
                    
                    return
                    
                }
                
                
                
                print(folderList,"folderList")
                
                
                
                completion(folderList.files?.first?.identifier)
                
            }
            
        }
    
}
