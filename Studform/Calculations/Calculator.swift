//
//  CellInputManager.swift
//  Studform
//
//  Created by iOS development on 18/9/2017.
//  Copyright © 2017 iOS development. All rights reserved.
//

import Foundation

// This struct is responible for taking the calculatorDataPoint and perform calculations from the Concrete Types file

struct Calculator {
    
    static func getResult(calculationDataPoint: CalculatorDataPoint, ceilingType: Modules, moduleType: [Modules]) throws -> Result {
        
        switch ceilingType {
            
        case .KWIKLOC_REGAL: // can throw from the calculation method
            
            do {
                return try Result.Regal(type: Regal(calculationDataPoint: calculationDataPoint, moduleSelected: moduleType))
            }
            
        case .KWIKLOC_PREMIUM:
            
            do {
                return try Result.Premium(type: Premium(calculationDataPoint: calculationDataPoint, moduleSelected: moduleType))
            }
            
        case .KWIKLOC_CORPORATE :
            
            do {
                return try Result.Corporate(type: Corporate(calculationDataPoint: calculationDataPoint, moduleSelected: moduleType))
            }
            
        case .ONEWAY_EXPOSED :
            
            do {
                return try Result.Oneway(type: Oneway(calculationDataPoint: calculationDataPoint, moduleSelected: moduleType))
            }
            
        case .KWIKLOC_SEISMIC :
            
            do {
                return try Result.Seismic(type: Seismic(calculationDataPoint: calculationDataPoint, moduleSelected: moduleType))
            }
            
        case .CEILING_SUSPENSION :
            
            do {
                return try Result.Concelead(type: ConcealedSystems(calculationDataPoint: calculationDataPoint, moduleSelected: moduleType))
            }


            //        case .CEILING_SUSPENSION : break
            //        case .KLIK_STEEL_CEILING_SYSTEM : break
            
        case .KLIK_STEEL_CEILING_SYSTEM :
            
            do {
                return try Result.KlikSteel(type: KlikSteel(calculationDataPoint: calculationDataPoint, moduleSelected: moduleType))
            }
            
        default:
            return Result.NotMatched
        }
        
    }
    
    
    
    
    
    
}






