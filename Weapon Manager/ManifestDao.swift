//
//  ManifestDao.swift
//  Weapon Manager
//
//  Created by HOEING, MATT J [AG-Contractor/1000] on 12/19/17.
//  Copyright © 2017 dan.smith. All rights reserved.
//

import Foundation
import SQLite

class ManifestDao {
    class func testConnect() {
        do {
            print("connecting")
            let path = Bundle.main.path(forResource: "world_sql_content_2fba9035f04307960f6baafa1784e848", ofType: "sqlite3")!
            
            print("got path: \(path)")
            let database = try Connection(path, readonly: true)
            ///Users/mjhoei/swift/weapon-manager/Resources/world_sql_content_2fba9035f04307960f6baafa1784e848.sqlite3

            print("connected")
            for row in try database.prepare("SELECT * FROM DestinyInventoryItemDefinition") {
                print("row: \(row[0] ?? "(no value)"), \(row[1] ?? "(no value)")")
            }
        } catch {
            print("caught an exception: \(error.localizedDescription)")
        }
    }
}
