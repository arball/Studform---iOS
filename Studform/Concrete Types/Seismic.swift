//
//  Seismic.swift
//  Studform
//
//  Created by iOS development on 5/10/2017.
//  Copyright © 2017 iOS development. All rights reserved.
//

import Foundation

struct Seismic {
    
    var mainTee: Double?
    var _1200_spacer: Double?
    var _600_spacer: Double?
    var hangingRod: Double?
    var suspensionClip: Double?
    var anchorClip: Double?
    var tiles: Double?
    var fixedWallAngle: Double?
    var floatingWallAngle: Double?
    var wallAngle: Double?
    var seismicClips: Double?
    var fixedWallAngleBracket: Double?
    var floatWallAngleBracket: Double?
    var bracingPoint: Double?
    
    let moduleSelected: [Modules]
    let calculationDataPoint: CalculatorDataPoint
    
    init(calculationDataPoint: CalculatorDataPoint, moduleSelected: [Modules]) throws {
        self.moduleSelected = moduleSelected
        self.calculationDataPoint = calculationDataPoint
        
        do {
            try calculate()
        }
    }
    
    mutating func calculate () throws {
        
        if moduleSelected.contains(Modules._1200X600_REGULAR_H_PATTERN_SEISMIC) {
            print("seismic 1200 X 600 H pattern")
            
            guard let area = Double(calculationDataPoint.area!),
            let _1200X300_t_bar_troffer_light = calculationDataPoint._1200X300_TBarTrofferLightFitting,
            let _600X600_cond_register = calculationDataPoint._600X600_AirCondRegister,
            let largeOpenArea = calculationDataPoint.largeOpenArea,
            let lengthDrop = Double(calculationDataPoint.lengthDrop!),
                let spareTiles = Double(calculationDataPoint.spareTile!) else {
                    throw InputError.incompleteArgument
            }
            
            mainTee = (area / 100) * 23
            
            seismicClips = (area / 100) * 138
            
            if _1200X300_t_bar_troffer_light {
                _1200_spacer = ((area / 100) * 136) + (area / 100) * 16
            } else {
                _1200_spacer = (area / 100) * 136
            }
            
            if _600X600_cond_register {
                _600_spacer = (area / 100) * 6
            } else {
                _600_spacer = 0
            }
            
            if largeOpenArea {
                fixedWallAngle = (area / 100) * 3
                floatingWallAngle = (area / 100) * 3
            } else {
                fixedWallAngle = (area / 100) * 6
                floatingWallAngle = (area / 100) * 6
            }
            
            fixedWallAngleBracket = fixedWallAngle.map {($0 * 3.6) / 0.9}
            floatWallAngleBracket = floatingWallAngle.map {($0 * 3.6) / 0.9}
            
            if ((lengthDrop >= 0.100) && (lengthDrop <= 10.000)) {
                if (lengthDrop <= 1) {
                    hangingRod = ((area / 100) * 64) / 3;
                } else if ((lengthDrop > 1) && (lengthDrop < 1.8)) {
                    hangingRod = ((((area / 100) * 64) / 3) * 3) / 2;
                } else {
                    hangingRod = (((area / 100) * 64) / 3) * 3;
                }
            } else {
                throw InputError.lengthDropOutOfBound
            }
            
            suspensionClip = (area / 100) * 64
            anchorClip = suspensionClip

            tiles = (area / 0.72) + spareTiles
        }
        
        if moduleSelected.contains(Modules._600X600_SEISMIC) {
            print("seismic 600 X 600")
            
            guard let area = Double(calculationDataPoint.area!),
                let _1200X300_t_bar_troffer_light = calculationDataPoint._1200X300_TBarTrofferLightFitting,
                let _600X600_cond_register = calculationDataPoint._600X600_AirCondRegister,
                let largeOpenArea = calculationDataPoint.largeOpenArea,
                let lengthDrop = Double(calculationDataPoint.lengthDrop!),
                let spareTiles = Double(calculationDataPoint.spareTile!) else {
                    throw InputError.incompleteArgument
            }
            
            mainTee = (area / 100) * 23
            
            if area > 300 {
                bracingPoint = area * 81
            } else {
                bracingPoint = 0
            }
            
            if _1200X300_t_bar_troffer_light {
                _1200_spacer = ((area / 100) * 136) + (area / 100) * 16
            } else {
                _1200_spacer = (area / 100) * 136
            }
            
            if _600X600_cond_register {
                _600_spacer = (area / 100) * 136
            } else {
                _600_spacer = (area / 100) * 136
            }
            
            if largeOpenArea {
                wallAngle = (area / 100) * 6
            } else {
                wallAngle = (area / 100) * 2
            }
            
            if ((lengthDrop >= 0.100) && (lengthDrop <= 10.000)) {
                if (lengthDrop <= 1) {
                    hangingRod = ((area / 100) * 64) / 3;
                } else if ((lengthDrop > 1) && (lengthDrop < 1.8)) {
                    
                    hangingRod = ((((area / 100) * 64) / 3) * 3) / 2;
                } else {
                    
                    hangingRod = (((area / 100) * 64) / 3) * 3;
                }
                
            } else {
                throw InputError.lengthDropOutOfBound
            }
            
            suspensionClip = (area / 100) * 64;
            anchorClip = suspensionClip
            
            tiles = (area / 0.36) + spareTiles
        }
    }
}
