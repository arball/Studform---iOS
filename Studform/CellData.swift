//
//  InputCells.swift
//  Studform
//
//  Created by iOS development on 23/8/2017.
//  Copyright © 2017 iOS development. All rights reserved.
//

import Foundation

enum UserInputCellType {
    case booleanInput
    case numericInput
}

class CellData { // The cellType property is for future refactoring
    var title: String?
    var value: Any?
    
    var cellType: UserInputCellType {
        if let _ = value as? Bool {
            return .booleanInput
        } else {
            return .numericInput
        }
    }
}


































