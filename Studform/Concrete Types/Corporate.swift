//
//  Corporate.swift
//  Studform
//
//  Created by iOS development on 5/10/2017.
//  Copyright © 2017 iOS development. All rights reserved.
//

import Foundation

struct Corporate {
    
    // all possible outputs
    
    var mainTee: Double?
    var _1200_spacer: Double?
    var _1350_spacer: Double?
    var _1500_spacer: Double?
    var c_spline: Double?
    var t_spline: Double?
    var wallAngle: Double?
    var hangingRod: Double?
    var suspensionClip: Double?
    var anchorClip: Double?
    var _1200X400_tile: Double?
    var _1200X300_tile: Double?
    var _1350X450_tile: Double?
    var _1500X500_tile: Double?
    var _1500X300_tile: Double?
    
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
        
        // MARK: - (Corporate) - 1200 X 1200
        
        if moduleSelected.contains(Modules._1200X1200MM) {
            
            guard let area = Double(calculationDataPoint.area!),
                let c_spline_selected = calculationDataPoint.c_spline_input,
                let t_spline_selected = calculationDataPoint.t_spline_input,
                let _1200X400Tiles_selected = calculationDataPoint._1200X400Tiles_input,
                let _1200X300Tiles_selected = calculationDataPoint._1200X300Tiles_input,
                let largeOpenArea = calculationDataPoint.largeOpenArea,
                let spareTile = Double(calculationDataPoint.spareTile!),
                let lengthDrop = Double(calculationDataPoint.lengthDrop!) else {
                    throw InputError.incompleteArgument
            }
            
            mainTee = (area / 100) * 23
            _1200_spacer = (area / 100) * 68
            
            if _1200X400Tiles_selected && c_spline_selected && t_spline_selected == false {
                c_spline = (area / 1.44) * 4
                t_spline = 0
            }
            
            if _1200X400Tiles_selected && c_spline_selected && t_spline_selected {
                c_spline = (area / 1.44) * 2
                t_spline = (area / 1.44)
            }
            
            if _1200X300Tiles_selected && c_spline_selected && t_spline_selected == false {
                c_spline = ((area / 1.44) * 6);
                t_spline = 0
            }
            if _1200X300Tiles_selected && c_spline_selected && t_spline_selected {
                c_spline = ((area / 1.44) * 2);
                t_spline = ((area / 1.44) * 2);
            }
            
            if largeOpenArea {
                wallAngle = (area / 100) * 6;
            } else {
                wallAngle = ((area / 100) * 6) * 2;
            }
            
            if ((lengthDrop >= 0.100) && (lengthDrop <= 10)) {
                if (lengthDrop <= 1) {
                    hangingRod = ((area / 100) * 64) / 3;
                } else if (lengthDrop > 1 && lengthDrop < 1.8) {
                    hangingRod = ((((area / 100) * 64) / 3) * 3) / 2;
                } else if (lengthDrop > 1.8) {
                    hangingRod = (((area / 100) * 64) / 3) * 3
                }
            } else {
                throw InputError.lengthDropOutOfBound
            }
            
            suspensionClip = (area / 100) * 64
            anchorClip = suspensionClip
            
            if _1200X300Tiles_selected && _1200X400Tiles_selected {
                throw InputError._1200X400_AND_1200X300_selected
            }
            
            if _1200X400Tiles_selected
                && _1200X300Tiles_selected == false {
                _1200X400_tile = (((area / 1.44) * 3) + spareTile); //tile calculation in 24mm
            }
            if _1200X300Tiles_selected && _1200X400Tiles_selected == false {
                _1200X300_tile = (((area / 1.44) * 4) + spareTile);
            }
        }
        
        // MARK: - (Corporate) - 1350 X 1350mm
        
        if moduleSelected.contains(Modules._1350X1350MM) {
            
            guard let area = Double(calculationDataPoint.area!),
                let c_spline_selected = calculationDataPoint.c_spline_input,
                let t_spline_selected = calculationDataPoint.t_spline_input,
                let _1350X450Tiles_selected = calculationDataPoint._1350X450Tiles_input,
                let largeOpenArea = calculationDataPoint.largeOpenArea,
                let spareTile = Double(calculationDataPoint.spareTile!),
                let lengthDrop = Double(calculationDataPoint.lengthDrop!) else {
                    throw InputError.incompleteArgument
            }
            
            mainTee = (area / 100) * 18.3
            _1350_spacer = (area / 100) * 54.9
            
            if  c_spline_selected && t_spline_selected == false {
                c_spline = ((area / 1.8225) * 4);
                t_spline = 0
            }
            if  c_spline_selected && t_spline_selected {
                c_spline = ((area / 1.8225) * 2);
                t_spline = ((area / 1.8225) * 1);
            }
            
            if largeOpenArea {
                wallAngle = (area / 100) * 6;
            } else {
                wallAngle = ((area / 100) * 6) * 2;
            }
            
            if ((lengthDrop >= 0.100) && (lengthDrop <= 10)) {
                if (lengthDrop <= 1) {
                    hangingRod = ((area / 100) * 54.9) / 3;
                } else if (lengthDrop > 1 && lengthDrop < 1.8) {
                    hangingRod = ((((area / 100) * 54.9) / 3) * 3) / 2;
                } else if (lengthDrop > 1.8) {
                    hangingRod = (((area / 100) * 54.9) / 3) * 3
                }
            } else {
                throw InputError.lengthDropOutOfBound
            }
            
            suspensionClip = (area / 100) * 54.9
            anchorClip = suspensionClip
            
            if _1350X450Tiles_selected {
                _1350X450_tile = (area / 0.6075) + spareTile
            } else {
                _1350X450_tile = 0
            }
            
            if c_spline_selected == false && t_spline_selected {
                print("InputError.spline_option")
                throw InputError.spline_option
            }
            
        }
        
        // MARK: - (Corporate) - 1500 X 1500mm
        
        if moduleSelected.contains(Modules._1500X1500MM) {
            
            guard let area = Double(calculationDataPoint.area!),
                let c_spline_selected = calculationDataPoint.c_spline_input,
                let t_spline_selected = calculationDataPoint.t_spline_input,
                let _1500X500_tile_selected = calculationDataPoint._1500X500Tiles_input,
                let _1500X300_tile_selected = calculationDataPoint._1500X300Tiles_input,
                let largeOpenArea = calculationDataPoint.largeOpenArea,
                let spareTile = Double(calculationDataPoint.spareTile!),
                let lengthDrop = Double(calculationDataPoint.lengthDrop!) else {
                    throw InputError.incompleteArgument
            }
            
            mainTee = (area / 100) * 14.81
            _1500_spacer = (area / 100) * 44.44
            
            if c_spline_selected && t_spline_selected == false {
                c_spline = (area / 2.25) * 4
                t_spline = 0
            }
            
            // TODO: Check t_spline values
            
            if c_spline_selected && t_spline_selected {
                c_spline = ((area / 2.25) * 2);
                t_spline = ((area / 2.25));
            }
            
            if c_spline_selected && t_spline_selected == false {
                c_spline = ((area / 2.25) * 8);
                t_spline = 0;
            }
            
            if c_spline_selected && t_spline_selected == false {
                c_spline = ((area / 2.25) * 2);
                t_spline = ((area / 2.25) * 3);
            }
            
            if largeOpenArea {
                wallAngle = (area / 100) * 6;
            } else {
                wallAngle = ((area / 100) * 6) * 2;
            }
            
            if ((lengthDrop >= 0.100) && (lengthDrop <= 10)) {
                if (lengthDrop <= 1) {
                    hangingRod = ((area / 100) * 44.4) / 3;
                } else if (lengthDrop > 1 && lengthDrop < 1.8) {
                    hangingRod = ((((area / 100) * 44.4) / 3) * 3) / 2;
                } else if (lengthDrop > 1.8) {
                    hangingRod = (((area / 100) * 44.4) / 3) * 3
                }
            } else {
                throw InputError.lengthDropOutOfBound
            }
            
            suspensionClip = ((area / 100) * 44.4);
            anchorClip = suspensionClip
            
            if _1500X300_tile_selected && _1500X500_tile_selected {
                throw InputError._1500X500_AND_1500X300_selected
            }
            
            if _1500X500_tile_selected && _1500X300_tile_selected == false {
                _1500X500_tile = (((area / 2.25) * 3) + spareTile);
            }
            
            if _1500X500_tile_selected == false && _1500X300_tile_selected {
                _1500X300_tile = (((area / 2.25) * 5) + spareTile);
            }
        }
    }
}



















