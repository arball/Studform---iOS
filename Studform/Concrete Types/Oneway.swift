//
//  Oneway.swift
//  Studform
//
//  Created by iOS development on 5/10/2017.
//  Copyright © 2017 iOS development. All rights reserved.
//

import Foundation

struct Oneway {
    
    // all possible output
    
    var mainTee: Double?
    var c_spline: Double?
    var interlocking_t_spline: Double?
    var intermediate_t_spline: Double?
    var wallAngle: Double?
    var hangingRod: Double?
    var suspensionClip: Double?
    var anchorClip: Double?
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
        
        // MARK: - (Oneway) - 24mm T Bar One Way Exponse -> 1200 X 400 Tile Size/Module
        
        if moduleSelected.contains(Modules._24MM_T_BAR_EXPOSED) && moduleSelected.contains(Modules._1200X400_TILE_SIZE_T_BAR_EXPOSED) {
        
            print("(Oneway) - 24mm T Bar One Way Exponse -> 1200 X 400 Tile Size/Module")
            
            guard let area = Double(calculationDataPoint.area!),
            let c_spline_selected = calculationDataPoint.c_spline_input,
            let interlocking_t_spline_selected = calculationDataPoint.interlocking_t_spline,
            let intermediate_t_spline_selected = calculationDataPoint.intermediate_t_spline,
            let largeOpenArea = calculationDataPoint.largeOpenArea,
            let lengthDrop = Double(calculationDataPoint.lengthDrop!),
                let spareTile = Double(calculationDataPoint.spareTile!) else {
                    throw InputError.incompleteArgument
            }
            
            mainTee = (area / 100) * 23
            interlocking_t_spline = (area / 100) * 68
            
            if c_spline_selected && intermediate_t_spline_selected == false {
                c_spline = (area / 1.44) * 4
                intermediate_t_spline = 0
            }
            
            if c_spline_selected && intermediate_t_spline_selected {
                c_spline = ((area / 1.44) * 2);
                intermediate_t_spline = (area / 100) * 68;
            }
            
            tiles = ((area / 1.44) * 3) + spareTile
            
            if largeOpenArea {
                wallAngle = (area / 100) * 6
            } else {
                wallAngle = (area / 100) * 6 * 2
            }
            
            suspensionClip = (area / 100) * 64
            anchorClip = suspensionClip
            
            // throw conditions
            
            if ((lengthDrop >= 0.100) && (lengthDrop <= 10)) {
                if (lengthDrop <= 1) {
                    hangingRod = ((area / 100) * 64) / 3;
                } else if (lengthDrop > 1 && lengthDrop < 1.8) {
                    hangingRod = ((((area / 100) * 64) / 3) * 3) / 2;
                } else if (lengthDrop > 1.8) {
                    hangingRod = (((area / 100) * 64) / 3) * 3;
                }
            } else {
                throw InputError.lengthDropOutOfBound
            }
            
            if c_spline_selected == false && interlocking_t_spline_selected {
                throw InputError.spline_option
            }
        }
        
        // MARK: - (Oneway) - 24mm T Bar One Way Exponse -> 1350 X 450 Tile Size/Module
        
        if moduleSelected.contains(Modules._24MM_T_BAR_EXPOSED) && moduleSelected.contains(Modules._1350X450_TILE_SIZE_T_BAR_EXPOSED) {
            
            print("(Oneway) - 24mm T Bar One Way Exponse -> 1350 X 450 Tile Size/Module")
            
            guard let area = Double(calculationDataPoint.area!),
                let c_spline_selected = calculationDataPoint.c_spline_input,
                let interlocking_t_spline_selected = calculationDataPoint.interlocking_t_spline,
                let intermediate_t_spline_selected = calculationDataPoint.intermediate_t_spline,
                let largeOpenArea = calculationDataPoint.largeOpenArea,
                let lengthDrop = Double(calculationDataPoint.lengthDrop!),
                let spareTile = Double(calculationDataPoint.spareTile!) else {
                    throw InputError.incompleteArgument
            }
            
            mainTee = (area / 100) * 21
            
            interlocking_t_spline = (area / 100) * 55
            
            if c_spline_selected && intermediate_t_spline_selected == false {
                c_spline = (area / 1.8225) * 4
                intermediate_t_spline = 0
            }
            
            if c_spline_selected && interlocking_t_spline_selected {
                c_spline = (area / 1.8225) * 2
                intermediate_t_spline = (area / 100) * 55
            }
            
            tiles = ((area / 1.8225) * 3) + spareTile
            
            if largeOpenArea {
                wallAngle = (area / 100) * 6
            } else {
                wallAngle = (area / 100) * 6 * 2
            }
            
            suspensionClip = (area / 100) * 62
            anchorClip = suspensionClip
            
            // throw conditions
            
            if ((lengthDrop >= 0.100) && (lengthDrop <= 10)) {
                if (lengthDrop <= 1) {
                    hangingRod = ((area / 100) * 62) / 3;
                } else if (lengthDrop > 1 && lengthDrop < 1.8) {
                    hangingRod = ((((area / 100) * 62) / 3) * 3) / 2;
                } else if (lengthDrop > 1.8) {
                    hangingRod = (((area / 100) * 62) / 3) * 3;
                }
            } else {
                throw InputError.lengthDropOutOfBound
            }
            
            if c_spline_selected == false && interlocking_t_spline_selected {
                throw InputError.spline_option
            }
        }
        
        // MARK: - (Oneway) - 32mm Top Hat One Way Exponse -> 1200 X 400 Tile Size/Module
        
        if moduleSelected.contains(Modules._32MM_TOPHAT_EXPOSED) && moduleSelected.contains(Modules._1200X400_TILE_SIZE_TOPHAT_EXPOSED) {
            
            print("(Oneway) - 32mm Top Hat One Way Exponse -> 1200 X 400 Tile Size/Module")
            
            guard let area = Double(calculationDataPoint.area!),
                let c_spline_selected = calculationDataPoint.c_spline_input,
                let interlocking_t_spline_selected = calculationDataPoint.interlocking_t_spline,
                let intermediate_t_spline_selected = calculationDataPoint.intermediate_t_spline,
                let largeOpenArea = calculationDataPoint.largeOpenArea,
                let lengthDrop = Double(calculationDataPoint.lengthDrop!),
                let spareTile = Double(calculationDataPoint.spareTile!) else {
                    throw InputError.incompleteArgument
            }
            
            mainTee = (area / 100) * 23
            
            interlocking_t_spline = (area / 100) * 68
            
            if c_spline_selected && intermediate_t_spline_selected == false {
                c_spline = (area / 1.44) * 4
                intermediate_t_spline = 0
            }
            
            if c_spline_selected && interlocking_t_spline_selected {
                c_spline = (area / 1.44) * 2
                intermediate_t_spline = (area / 100) * 55
            }
            
            tiles = ((area / 1.44) * 3) + spareTile
            
            if largeOpenArea {
                wallAngle = (area / 100) * 6
            } else {
                wallAngle = (area / 100) * 6 * 2
            }
            
            suspensionClip = (area / 100) * 64
            anchorClip = suspensionClip
            
            // throw conditions
            
            if ((lengthDrop >= 0.100) && (lengthDrop <= 10)) {
                if (lengthDrop <= 1) {
                    hangingRod = ((area / 100) * 64) / 3;
                } else if (lengthDrop > 1 && lengthDrop < 1.8) {
                    hangingRod = ((((area / 100) * 64) / 3) * 3) / 2;
                } else if (lengthDrop > 1.8) {
                    hangingRod = (((area / 100) * 64) / 3) * 3;
                }
            } else {
                throw InputError.lengthDropOutOfBound
            }
            
            if c_spline_selected == false && interlocking_t_spline_selected {
                throw InputError.spline_option
            }
            
            
            
        }
        
        // MARK: - (Oneway) - 32mm Top Hat One Way Exponse -> 1350 X 450 Tile Size/Module
        
        if moduleSelected.contains(Modules._32MM_TOPHAT_EXPOSED) && moduleSelected.contains(Modules._1350X450_TILE_SIZE_TOPHAT_EXPOSED) {
            
            print("(Oneway) - 32mm T Bar One Way Exponse -> 1350 X 450 Tile Size/Module")
            
            guard let area = Double(calculationDataPoint.area!),
                let c_spline_selected = calculationDataPoint.c_spline_input,
                let interlocking_t_spline_selected = calculationDataPoint.interlocking_t_spline,
                let intermediate_t_spline_selected = calculationDataPoint.intermediate_t_spline,
                let largeOpenArea = calculationDataPoint.largeOpenArea,
                let lengthDrop = Double(calculationDataPoint.lengthDrop!),
                let spareTile = Double(calculationDataPoint.spareTile!) else {
                    throw InputError.incompleteArgument
            }
            
            mainTee = (area / 100) * 21
            
            interlocking_t_spline = (area / 100) * 55
            
            if c_spline_selected && intermediate_t_spline_selected == false {
                c_spline = (area / 1.8225) * 4
                intermediate_t_spline = 0
            }
            
            if c_spline_selected && interlocking_t_spline_selected {
                c_spline = (area / 1.8225) * 2
                intermediate_t_spline = (area / 100) * 55
            }
            
            tiles = ((area / 1.8225) * 3) + spareTile
            
            if largeOpenArea {
                wallAngle = (area / 100) * 6
            } else {
                wallAngle = (area / 100) * 6 * 2
            }
            
            suspensionClip = (area / 100) * 62
            anchorClip = suspensionClip
            
            // throw conditions
            
            if ((lengthDrop >= 0.100) && (lengthDrop <= 10)) {
                if (lengthDrop <= 1) {
                    hangingRod = ((area / 100) * 62) / 3;
                } else if (lengthDrop > 1 && lengthDrop < 1.8) {
                    hangingRod = ((((area / 100) * 62) / 3) * 3) / 2;
                } else if (lengthDrop > 1.8) {
                    hangingRod = (((area / 100) * 62) / 3) * 3;
                }
            } else {
                throw InputError.lengthDropOutOfBound
            }
            
            if c_spline_selected == false && interlocking_t_spline_selected {
                throw InputError.spline_option
            }

            
        }
        
        
        
        
        
        
        
        
    }
    
    
}
