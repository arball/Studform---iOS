//
//  StudformError.swift
//  Studform
//
//  Created by iOS development on 4/10/2017.
//  Copyright © 2017 iOS development. All rights reserved.
//

import Foundation

enum InputError: Error {
    
    // General Error
    case incompleteArgument
    case lengthDropOutOfBound
    case spline_option
    
    // Regal Error
    case _1200X400_AND_1200X300_selected
    
    // Corporate Error
    case _1500X500_AND_1500X300_selected

}
