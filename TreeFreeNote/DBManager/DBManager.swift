//
//  DBManager.swift
//  TreeFreeNote
//
//  Created by Vinod Kodavath on 23/07/23.
//

import Foundation
import SQLite3

class DBManager{
    static let shared = DBManager()
    init(){
        db = openDatabase()
        //        createTable(sql_query: querys().documentTableString)
        //        createTable(sql_query: querys().pagesTableString)
    }
    
    let dbPath: String = "TreeFreeNote.sqlite"
    var db:OpaquePointer?
    
    func openDatabase() -> OpaquePointer?{
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent(dbPath)
        var db: OpaquePointer? = nil
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK{
            print("error opening database")
            return nil
        }else{
            print("Successfully opened connection to database at \(fileURL) \(dbPath)")
            return db
        }
    }
    
    func createTable(sql_query : String) {
        var createTableStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, sql_query, -1, &createTableStatement, nil) == SQLITE_OK
        {
            if sqlite3_step(createTableStatement) == SQLITE_DONE
            {
                print("table created.")
            } else {
                print(" table could not be created.")
            }
        } else {
            print("CREATE TABLE statement could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
    }
    
    
    func insert(insert_query: String){
        print("insert_query ==> \(insert_query)")
        var insertStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, insert_query, -1, &insertStatement, nil) == SQLITE_OK {
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully inserted row.")
            } else {
                print("Could not insert row.")
            }
        } else {
            print("INSERT statement could not be prepared.")
        }
        sqlite3_finalize(insertStatement)
    }
    
    func getValues(tableName : String) -> Array<Dictionary<String, Any>> {
        let queryStatementString = "SELECT * FROM \(tableName);"
        var queryStatement: OpaquePointer? = nil
        var values = [Dictionary<String, Any>]()
        var dict = [Int: [String: Any]]()
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                //                var object: Dictionary<String, Any> = [:]
                let id = sqlite3_column_int(queryStatement, 0)
                //                object["id"] = String(id)
                //                if let cString = sqlite3_column_text(queryStatement, 1) {
                //                        let value = String(cString: cString)
                //                    object["text"] = String(value)
                //                    } else {
                //                        print("name not found")
                //                    }
                //
                //                values.append(object)
                
                if let queryResultCol1 = sqlite3_column_text(queryStatement, 1){
                    print("Query result is nil.")
                    let json = String(cString: queryResultCol1)
                    let data = Data(json.utf8)
                    do {
                        if let jsonDict = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                            dict[Int(id)] = jsonDict
                        }
                    } catch let error as NSError {
                        print(error)
                    }
                }
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return values
    }
    
    func getMaxRowId(tableName : String) -> String {
        let queryStatementString = "SELECT MAX(Id) FROM \(tableName);"
        var queryStatement: OpaquePointer? = nil
        var row_id: String = ""
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let id = sqlite3_column_int(queryStatement, 0)
                print("Query Result: \(id)")
                row_id = String(id)
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return row_id
    }
    
    func deleteByID(id:Int) {
        let deleteStatementStirng = "DELETE FROM person WHERE Id = ?;"
        var deleteStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, deleteStatementStirng, -1, &deleteStatement, nil) == SQLITE_OK {
            sqlite3_bind_int(deleteStatement, 1, Int32(id))
            if sqlite3_step(deleteStatement) == SQLITE_DONE {
                print("Successfully deleted row.")
            } else {
                print("Could not delete row.")
            }
        } else {
            print("DELETE statement could not be prepared")
        }
        sqlite3_finalize(deleteStatement)
    }
}
