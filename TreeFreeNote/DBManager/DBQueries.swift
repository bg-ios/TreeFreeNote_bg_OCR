//
//  DBQueries.swift
//  TreeFreeNote
//
//  Created by Vinod Kodavath on 23/07/23.
//

import Foundation

class querys{
    
    let dbManager = DBManager.shared
    //creating Tables
    let documentTableString = "CREATE TABLE IF NOT EXISTS document(Id INTEGER PRIMARY KEY,document_name TEXT,createdDate TEXT, document_type TEXT, linked_tag_id TEXT, security TEXT);"
    
    let pagesTableString = "CREATE TABLE IF NOT EXISTS page(Id INTEGER PRIMARY KEY, documentId INTEGER, pageNumber INTEGER, filePath TEXT);"
    
    let folderTableString = "CREATE TABLE IF NOT EXISTS folders(Id INTEGER PRIMARY KEY,createdDate TEXT, folder_name TEXT, parent_folder TEXT);"
    
    let securityTableString = "CREATE TABLE IF NOT EXISTS security(Id INTEGER PRIMARY KEY, salt TEXT,password TEXT, security_type TEXT);"
    
    let tagTableString = "CREATE TABLE IF NOT EXISTS tags(Id INTEGER PRIMARY KEY, tag_name TEXT);"
    
    
    
    // Insertng data into tables
    func insertDocuments(title: String, documentType: String, linkedTagId: String, security: String){
        let dateString = Utility().current_date()
        var query : String = ""
        let sqlQuery : String = String(format: "(\"%@\",\"%@\",\"%@\",\"%@\",\"%@\")", title, dateString, documentType, linkedTagId, security)
        query.append(sqlQuery)
        let insertdocumentString = "INSERT INTO document(document_name, createdDate, document_type, linked_tag_id, security) VALUES \(query);"
        dbManager.insert(insert_query: insertdocumentString)
        
    }
    
    func insertPages(documentId: Int, filesPathArray: [String]){
        var query : String = ""
        var index = 1
        for filePath in filesPathArray{
            let sqlQuery : String = String(format: "(\"%@\",\"%@\",\"%@\")", String(documentId), String(index), filePath)
            query.append(sqlQuery)
            index += 1
            break
        }
        let insertPagesString = "INSERT INTO page(documentId, pageNumber, filePath) VALUES \(query);"
        dbManager.insert(insert_query: insertPagesString)
        
    }
    
    func insertFolder(folder_name: String, parent_folder: String){
        let dateString = Utility().current_date()
        var query : String = ""
        let sqlQuery : String = String(format: "(\"%@\",\"%@\", \"%@\")",dateString, folder_name, parent_folder)
        query.append(sqlQuery)
        let insertFolderString = "INSERT INTO folders(createdDate, folder_name, parent_folder) VALUES \(query);"
        dbManager.insert(insert_query: insertFolderString)
        
    }
    
    func insertSecurity(salt: String, password: String, security_type: String){
        var query : String = ""
        let sqlQuery : String = String(format: "(\"%@\",\"%@\", \"%@\")",salt, password, security_type)
        query.append(sqlQuery)
        let insertFolderString = "INSERT INTO security(salt, password, security_type) VALUES \(query);"
        dbManager.insert(insert_query: insertFolderString)
        
    }
    
    func insertTags(tag_name: String){
        var query : String = ""
        let sqlQuery : String = String(format: "(\"%@\")",tag_name)
        query.append(sqlQuery)
        let insertFolderString = "INSERT INTO tags(tag_name) VALUES \(query);"
        dbManager.insert(insert_query: insertFolderString)
    }
    
    func get_values(){
        
    }
    
}



//CREATE TABLE Page (
//    id INTEGER PRIMARY KEY,
//    documentId INTEGER,
//    pageNumber INTEGER,
//    imagePath TEXT,
//    -- Other page metadata columns
//    FOREIGN KEY (documentId) REFERENCES Document(id)
//);
