//
//  StudformConcealed.swift
//  Studform
//
//  Created by iOS development on 5/10/2017.
//  Copyright © 2017 iOS development. All rights reserved.
//

import Foundation

struct ConcealedSystems {
    
    var mainTee: Double?
    var interlocking_t_spline: Double?
    var wallAngle: Double?
    var hangingRod: Double?
    var suspensionClips: Double?
    var anchorClips: Double?
    var tiles: Double?
    
    let moduleSelected: [Modules]
    let calculationDataPoint: CalculatorDataPoint
    
    init(calculationDataPoint: CalculatorDataPoint, moduleSelected: [Modules]) throws {
        self.moduleSelected = moduleSelected
        self.calculationDataPoint = calculationDataPoint
        
        do {
            try calculate()
        }
    }
    
    mutating func calculate() throws {
        
        if moduleSelected.contains(Modules._600MM_FURRING_CHANNEL) {
            print("Ceiling suspension 600mm")
            
            guard let area = Double(calculationDataPoint.area!),
            let _1200X300_t_bar_troffer_light = calculationDataPoint._1200X300_TBarTrofferLightFitting,
            let largeOpenArea = calculationDataPoint.largeOpenArea,
            let lenghtDrop = Double(calculationDataPoint.lengthDrop!),
                let spareTile = Double(calculationDataPoint.spareTile!) else {
                    throw InputError.incompleteArgument
            }
            
            mainTee = (area / 100) * 23;
            
            interlocking_t_spline = (area / 100) * 204;
            
            if largeOpenArea {
                wallAngle = (area / 100) * 6;
            } else {
                wallAngle = ((area / 100) * 6) * 2;
            }
            
            if ((lenghtDrop >= 0.100) && (lenghtDrop <= 10.000)) {
                if (lenghtDrop <= 1) {
                    hangingRod = (area / 100) * (64 / 3);
                } else if ((lenghtDrop > 1) && (lenghtDrop < 1.8)) {
                    hangingRod = ((area / 100) * (64 / 3)) * (3 / 2);
                } else {
                    hangingRod = ((area / 100) * (64 / 3)) * 3;
                }
            } else {
                throw InputError.lengthDropOutOfBound
            }
            
            suspensionClips = (area / 100) * 64;
            
            anchorClips = suspensionClips
            
            tiles = (area / 0.48) + spareTile
        }
        
        if moduleSelected.contains(Modules._450MM_FURRING_CHANNEL) {
            print("Ceiling suspension 450mm")
            
            guard let area = Double(calculationDataPoint.area!),
                let _1200X300_t_bar_troffer_light = calculationDataPoint._1200X300_TBarTrofferLightFitting,
                let largeOpenArea = calculationDataPoint.largeOpenArea,
                let lenghtDrop = Double(calculationDataPoint.lengthDrop!),
                let spareTile = Double(calculationDataPoint.spareTile!) else {
                    throw InputError.incompleteArgument
            }
            
            mainTee = (area / 100) * 23;
            
            interlocking_t_spline = (area / 100) * 204;
            
            if largeOpenArea {
                wallAngle = (area / 100) * 6;
            } else {
                wallAngle = ((area / 100) * 6) * 2;
            }
            
            if ((lenghtDrop >= 0.100) && (lenghtDrop <= 10.000)) {
                if (lenghtDrop <= 1) {
                    hangingRod = (area / 100) * (64 / 3);
                } else if ((lenghtDrop > 1) && (lenghtDrop < 1.8)) {
                    hangingRod = ((area / 100) * (64 / 3)) * (3 / 2);
                } else {
                    hangingRod = ((area / 100) * (64 / 3)) * 3;
                }
            } else {
                throw InputError.lengthDropOutOfBound
            }
            
            suspensionClips = (area / 100) * 64;
            
            anchorClips = suspensionClips
            
            tiles = (area / 0.48) + spareTile
        }
        
    }
    
    
    
}

















