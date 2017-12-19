//
//  Person.swift
//  Weapon Manager
//
//  Created by dan.smith on 12/18/17.
//  Copyright © 2017 dan.smith. All rights reserved.
//

import UIKit

class Person {
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

