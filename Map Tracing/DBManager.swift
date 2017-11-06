//
//  DBManager.swift
//  fmdbExample
//
//  Created by NomiMalik on 03/05/2017.
//  Copyright © 2017 NomiMalik. All rights reserved.
//

import UIKit



class DBManager: NSObject {

    static let shared: DBManager = DBManager()
    
    let databaseFileName = "Locations.sqlite"
    
    var pathToDatabase: String!
    
    var database: FMDatabase!
    
    override init() {
        super.init()
        
      
        
        let documentsDirectory = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString) as String
        pathToDatabase = documentsDirectory.appending("/\(databaseFileName)")
        print(pathToDatabase)
    }
    
    func createDatabase() -> Bool {
        let created = false
        
        if !FileManager.default.fileExists(atPath: pathToDatabase) {
            database = FMDatabase(path: pathToDatabase!)
            
            //if database != nil {
            // Open the database.
            if database.open() {
                let LocationTable = "create table Location (sname text not null,ename text not null,mname text not null)"
                
                do {
                    try database.executeUpdate(LocationTable, values: nil)
                    print("Created LOC TABLE")
                    
                    print(pathToDatabase)
                }
                catch {
                    print("Could not create table.")
                    print(error.localizedDescription)
                }
                
                // At the end close the database.
                database.close()
                // }
                //                else {
                //                    print("Could not open the database.")
                //                }
            }
        }
        database = FMDatabase(path: pathToDatabase!)
        
        return created
    }
    
    func openDatabase() -> Bool {
        if database == nil {
            if FileManager.default.fileExists(atPath: pathToDatabase) {
                database = FMDatabase(path: pathToDatabase)
            }
        }
        
        if database != nil {
            if database.open() {
                return true
            }
        }
        
        return false
    }
    
func Locinsert(sname:String, ename:String, mname:String)
{
    if openDatabase()
    {
        if database.tableExists("LocationTable")
        {
            do
            {
                
                try database.executeQuery("insert into LocationTable(sname,ename,mname) values(?,?,?)", values: [sname,ename,mname])
                
            }
            catch
            {
                print(error.localizedDescription)
            }
        }
        else
        {
            print("Table Users Not exist")
        }
        
        database.close()
    }
    else
    {
        print(database.lastErrorMessage())
    }
    
}
    
}
