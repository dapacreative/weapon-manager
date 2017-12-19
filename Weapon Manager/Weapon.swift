//
//  Weapon.swift
//  Weapon Manager
//
//  Created by dan.smith on 12/18/17.
//  Copyright © 2017 dan.smith. All rights reserved.
//

import UIKit

class Weapon {
    //MARK: Properties
    
    var name: String
    
    //MARK: Initiliziation
    
    init?(name: String) {
        
        if name.isEmpty {
            return nil
        }
        
        self.name = name
    }
}
