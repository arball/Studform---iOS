//
//  Premium.swift
//  Studform
//
//  Created by iOS development on 5/10/2017.
//  Copyright © 2017 iOS development. All rights reserved.
//

import Foundation

struct Premium {
    
    // all possible outputs
    
    var mainTee: Double?
    var _1200_Spacer: Double?
    var _600_Spacer: Double?
    var hanging_rod: Double?
    var suspensionClips: Double?
    var anchorClips: Double?
    var tile: Double?
    var wallAngle: Double?
    var c_spline: Double?
    var t_spline: Double?
    
    var _1200X300_tile: Double?
    var _1200X400_tile: Double?
    
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
        // MARK: - (Premium) - 1200 X 600 Regular H Pattern
        
        if moduleSelected.contains(Modules._1200X600_REGULAR_H_PATTERN_PREMIUM) {
            
            guard let area = Double(calculationDataPoint.area!),
                let _1200X300_T_bar_Troffer_selected = calculationDataPoint._1200X300_TBarTrofferLightFitting,
                let _600X600_Air_Cond_selected = calculationDataPoint._600X600_AirCondRegister,
                let largeOpenArea_selected = calculationDataPoint.largeOpenArea,
                let lengthDrop = Double(calculationDataPoint.lengthDrop!),
                let spareTile = Double(calculationDataPoint.spareTile!) else {
                    throw InputError.incompleteArgument
            }
            
            mainTee = (area / 100) * 23
            
            if _1200X300_T_bar_Troffer_selected {
                _1200_Spacer = (area / 100 * 136) + (area / 100) * 16
            } else {
                _1200_Spacer = 0
            }
            
            if _600X600_Air_Cond_selected {
                _600_Spacer = (area / 100) * 6
            } else {
                _600_Spacer = 0
            }
            
            if largeOpenArea_selected {
                wallAngle = (area / 100) * 6
            } else {
                wallAngle = ((area / 100) * 6) * 2
            }
            
            suspensionClips = (area / 100) * 128
            anchorClips = suspensionClips
            tile = (area / 0.36) + spareTile
            
            if ((lengthDrop >= 0.100) && (lengthDrop <= 10.000)) {
                if (lengthDrop <= 1) {
                    hanging_rod = ((area / 100) * 64) / 3;
                } else if ((lengthDrop > 1) && (lengthDrop < 1.8)) {
                    hanging_rod = ((((area / 100) * 64) / 3) * 3) / 2;
                } else {
                    hanging_rod = (((area / 100) * 64) / 3) * 3;
                }
            } else {
                throw InputError.lengthDropOutOfBound
            }
        }
        
        // MARK: - (Premium) - 1200 X 1200
        
        if moduleSelected.contains(Modules._1200X1200_PREMIUM) {
            print("Regal 1200 X 1200")
            
            guard let area = Double(calculationDataPoint.area!),
                let _1200X400_tiles_selected = calculationDataPoint._1200X400Tiles_input,
                let _1200X300_tiles_selected = calculationDataPoint._1200X300Tiles_input,
                let c_spline_selected = calculationDataPoint.c_spline_input,
                let t_spline_selected = calculationDataPoint.t_spline_input,
                let largeOpenArea_selected = calculationDataPoint.largeOpenArea,
                let lengthDrop = Double(calculationDataPoint.lengthDrop!),
                let spareTile = Double(calculationDataPoint.spareTile!) else {
                    print("input error")
                    throw InputError.incompleteArgument
            }
            
            mainTee = (area / 100) * 23
            _1200_Spacer = (area / 100) * 68
            
            if _1200X400_tiles_selected && c_spline_selected && t_spline_selected == false {
                c_spline = (area / 1.44) * 4
                t_spline = 0
            }
            
            if _1200X400_tiles_selected && c_spline_selected && t_spline_selected {
                c_spline = (area / 1.44) * 2
                t_spline = (area / 1.44)
            }
            
            if _1200X300_tiles_selected && c_spline_selected && t_spline_selected == false {
                c_spline = (area / 1.44) * 6
                t_spline = 0
            }
            
            if _1200X300_tiles_selected && c_spline_selected && t_spline_selected {
                c_spline = (area / 1.44) * 2
                t_spline = (area / 1.44) * 2
            }
            
            if _1200X400_tiles_selected && _1200X300_tiles_selected == false {
                _1200X400_tile = ((area / 1.44) * 3) + spareTile
            }
            
            if _1200X400_tiles_selected == false && _1200X300_tiles_selected {
                _1200X300_tile = ((area / 1.44) * 4) + spareTile
            }
            
            if largeOpenArea_selected {
                wallAngle = (area / 100) * 6
            } else {
                wallAngle = ((area / 100) * 6) * 2
            }
            
            suspensionClips = (area / 100) * 64
            anchorClips = suspensionClips
            
            // throwing conditionals
            
            if ((lengthDrop >= 0.100) && (lengthDrop <= 10)) {
                if (lengthDrop <= 1) {
                    hanging_rod = ((area / 100) * 64) / 3;
                } else if (lengthDrop > 1 && lengthDrop < 1.8) {
                    hanging_rod = ((((area / 100) * 64) / 3) * 3) / 2;
                } else if (lengthDrop > 1.8) {
                    hanging_rod = (((area / 100) * 64) / 3) * 3;
                }
            } else {
                print("lengthDrop Error")
                throw InputError.lengthDropOutOfBound
            }
            
            if _1200X300_tiles_selected && _1200X400_tiles_selected {
                print("InputError._1200X400_AND_1200X300_selected")
                throw InputError._1200X400_AND_1200X300_selected
            }
            
            if c_spline_selected == false && t_spline_selected {
                print("InputError.spline_option")
                throw InputError.spline_option
            }
        }
        
        // MARK: - (Premium) - 600 X 600
        
        if moduleSelected.contains(Modules._600X600_PREMIUM) {
            
            print("Regal 600 X 600")
            
            guard let area = Double(calculationDataPoint.area!),
                let _1200X300_T_bar_Troffer_selected = calculationDataPoint._1200X300_TBarTrofferLightFitting,
                let _600X600_Air_Cond_selected = calculationDataPoint._600X600_AirCondRegister,
                let largeOpenArea_selected = calculationDataPoint.largeOpenArea,
                let lengthDrop = Double(calculationDataPoint.lengthDrop!),
                let spareTile = Double(calculationDataPoint.spareTile!) else {
                    throw InputError.incompleteArgument
            }
            
            mainTee = (area / 100) * 23
            
            if _1200X300_T_bar_Troffer_selected {
                _1200_Spacer = ((area / 100) * 136) + (area / 100) * 16
            } else {
                _1200_Spacer = (area / 100) * 136
            }
            
            if _600X600_Air_Cond_selected {
                _600_Spacer = (area / 100) * 136
            } else {
                _600_Spacer = (area / 100) * 136
            }
            
            if largeOpenArea_selected {
                wallAngle = (area / 100) * 6
            } else {
                wallAngle = (area / 100)
            }
            
            // throwing conditions
            
            if ((lengthDrop >= 0.100) && (lengthDrop <= 10.000)) {
                
                if (lengthDrop <= 1) {
                    hanging_rod = ((area / 100) * 64) / 3;
                } else if ((lengthDrop > 1) && ((lengthDrop) < 1.8)) {
                    
                    hanging_rod = ((((area / 100) * 64) / 3) * 3) / 2;
                } else {
                    
                    hanging_rod = (((area / 100) * 64) / 3) * 3;
                }
                
            } else {
                throw InputError.lengthDropOutOfBound
            }
            
            suspensionClips = (area / 100) * 64
            anchorClips = suspensionClips
            
            tile = (area / 0.36) + spareTile
        }
        
        // MARK: - (Premium) - 600 X 600 Heavy
        
        if moduleSelected.contains(Modules._600X600_HEAVY_DUTY_PREMIUM) {
            print("Regal 600 X 600 Heavy")
            
            guard let area = Double(calculationDataPoint.area!),
                let _1200X300_T_bar_Troffer_selected = calculationDataPoint._1200X300_TBarTrofferLightFitting,
                let _600X600_Air_Cond_selected = calculationDataPoint._600X600_AirCondRegister,
                let largeOpenArea_selected = calculationDataPoint.largeOpenArea,
                let lengthDrop = Double(calculationDataPoint.lengthDrop!),
                let spareTile = Double(calculationDataPoint.spareTile!) else {
                    throw InputError.incompleteArgument
            }
            
            mainTee = (area / 100) * 46
            
            if _1200X300_T_bar_Troffer_selected {
                _1200_Spacer = (area / 100) * 16
            } else {
                _1200_Spacer = 0
            }
            
            if _600X600_Air_Cond_selected {
                _600_Spacer = (area / 100) * 272
            } else {
                _600_Spacer = (area / 100) * 272
            }
            
            if largeOpenArea_selected {
                wallAngle = (area / 100) * 6
            } else {
                wallAngle = ((area / 100) * 6) * 2
            }
            
            if ((lengthDrop >= 0.100) && (lengthDrop <= 10.000)) {
                if (lengthDrop <= 1) {
                    hanging_rod = ((area / 100) * 128) / 3;
                } else if ((lengthDrop > 1) && (lengthDrop < 1.8)) {
                    hanging_rod = ((((area / 100) * 128) / 3) * 3) / 2;
                } else {
                    hanging_rod = (((area / 100) * 128) / 3) * 3;
                }
            } else {
                throw InputError.lengthDropOutOfBound
            }
            
            suspensionClips = (area / 100) * 128
            anchorClips = suspensionClips
            
            tile = (area / 0.35) + spareTile
            
        }
    }
}


















