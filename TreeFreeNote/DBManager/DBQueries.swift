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
    let documentTableString = "CREATE TABLE IF NOT EXISTS document(Id INTEGER PRIMARY KEY,title TEXT,createdDate TEXT, FileFormate TEXT);"
    
    let pagesTableString = "CREATE TABLE IF NOT EXISTS page(Id INTEGER PRIMARY KEY, documentId INTEGER,pageNumber INTEGER, filePath TEXT);"
    
    
    // Insertng data into tables
    func insertDocuments(title: String, FileFormate: String){
        let dateString = Utility().current_date()
        var query : String = ""
        let sqlQuery : String = String(format: "(\"%@\",\"%@\",\"%@\")", title, dateString, FileFormate)
        query.append(sqlQuery)
        let insertdocumentString = "INSERT INTO document(title, createdDate, FileFormate) VALUES \(query);"
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
    
    
}



//CREATE TABLE Page (
//    id INTEGER PRIMARY KEY,
//    documentId INTEGER,
//    pageNumber INTEGER,
//    imagePath TEXT,
//    -- Other page metadata columns
//    FOREIGN KEY (documentId) REFERENCES Document(id)
//);
