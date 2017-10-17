//
//  TableViewCells.swift
//  Studform
//
//  Created by iOS development on 29/8/2017.
//  Copyright © 2017 iOS development. All rights reserved.
//

import Foundation

struct TableViewCells {
    
    static func getTableViewCell(ceilingType: Modules, moduleType: [Modules]) -> [(title: String, cellType: UserInputCellType)]{
        
        var cells = [(title: String, cellType: UserInputCellType)]()
        
        switch (ceilingType) {
            
        case .KWIKLOC_REGAL :
            
            if moduleType == [._1200X600_REGULAR_H_PATTERN_REGAL] || moduleType == [._600X600_REGAL] || moduleType == [._600X600_HEAVY_DUTY_REGAL] {
                
                cells =
                    [
                        (InputTitle.area, .numericInput),
                        (InputTitle._1200X300_t_bar_troffer, .booleanInput),
                        (InputTitle.largeOpenArea, .booleanInput),
                        (InputTitle._600X600_air_cond_register, .booleanInput),
                        (InputTitle.lengthDrop, .numericInput),
                        (InputTitle.spareTile, .numericInput)
                        
                ]
            } else if moduleType == [._1200X1200_REGAL] {
                
                cells =
                    [
                        (InputTitle.area, .numericInput),
                        (InputTitle
                            ._1200X400_tiles, .booleanInput),
                        (InputTitle._1200X300_tiles, .booleanInput),
                        (InputTitle.c_spline, .booleanInput),
                        (InputTitle.t_spline, .booleanInput),
                        (InputTitle.largeOpenArea, .booleanInput),
                        (InputTitle.lengthDrop, .numericInput),
                        (InputTitle.spareTile, .numericInput)
                ]
            }
            
        case .KWIKLOC_PREMIUM :
            
            if moduleType == [._1200X600_REGULAR_H_PATTERN_PREMIUM] || moduleType == [._600X600_PREMIUM] || moduleType == [._600X600_HEAVY_DUTY_PREMIUM] {
                
                cells =
                    [
                        (InputTitle.area, .numericInput),
                        (InputTitle._1200X300_t_bar_troffer, .booleanInput),
                        (InputTitle.largeOpenArea, .booleanInput),
                        (InputTitle._600X600_air_cond_register, .booleanInput),
                        (InputTitle.lengthDrop, .numericInput),
                        (InputTitle.spareTile, .numericInput)
                        
                ]
            } else if moduleType == [._1200X1200_PREMIUM] {
                
                cells =
                    [
                        (InputTitle.area, .numericInput),
                        (InputTitle._1200X400_tiles, .booleanInput),
                        (InputTitle._1200X300_tiles, .booleanInput),
                        (InputTitle.c_spline, .booleanInput),
                        (InputTitle.t_spline, .booleanInput),
                        (InputTitle.largeOpenArea, .booleanInput),
                        (InputTitle.lengthDrop, .numericInput),
                        (InputTitle.spareTile, .numericInput)
                ]
            }
            
        case .KWIKLOC_CORPORATE :
            
            if moduleType == [._1200X1200MM] {
                
                cells =
                    [
                        (InputTitle.area, .numericInput),
                        (InputTitle._1200X400_tiles, .booleanInput),
                        (InputTitle._1200X300_tiles, .booleanInput),
                        (InputTitle.c_spline, .booleanInput),
                        (InputTitle.t_spline, .booleanInput),
                        (InputTitle.largeOpenArea, .booleanInput),
                        (InputTitle.lengthDrop, .numericInput),
                        (InputTitle.spareTile, .numericInput)
                ]
            } else if moduleType == [._1350X1350MM] {
                
                cells =
                    [
                        (InputTitle.area, .numericInput),
                        (InputTitle._1350X450_tiles, .booleanInput),
                        (InputTitle.c_spline, .booleanInput),
                        (InputTitle.t_spline, .booleanInput),
                        (InputTitle.largeOpenArea, .booleanInput),
                        (InputTitle.lengthDrop, .numericInput),
                        (InputTitle.spareTile, .numericInput)
                ]
            } else if moduleType == [._1500X1500MM] {
                
                cells =
                    
                    [
                        (InputTitle.area, .numericInput),
                        (InputTitle._1500X500_tiles, .booleanInput),
                        (InputTitle._1500X300_tiles, .booleanInput),
                        (InputTitle.c_spline, .booleanInput),
                        (InputTitle.t_spline, .booleanInput),
                        (InputTitle.largeOpenArea, .booleanInput),
                        (InputTitle.lengthDrop, .numericInput),
                        (InputTitle.spareTile, .numericInput)
                ]
            }
        case .ONEWAY_EXPOSED :
            
            cells =
                
                [
                    (InputTitle.area, .numericInput),
                    (InputTitle.c_spline, .booleanInput),
                    (InputTitle.interlocking_t_spline, .booleanInput),
                    (InputTitle.intermediate_t_spline, .booleanInput),
                    (InputTitle.largeOpenArea, .booleanInput),
                    (InputTitle.lengthDrop, .numericInput),
                    (InputTitle.spareTile, .numericInput)
            ]
            
        case .KWIKLOC_SEISMIC :
            if moduleType == [._1200X600_REGULAR_H_PATTERN_SEISMIC] {
                
                cells =
                    [
                        (InputTitle.area, .numericInput),
                        (InputTitle._1200X300_t_bar_troffer, .booleanInput),
                        (InputTitle.largeOpenArea, .booleanInput),
                        (InputTitle._600X600_air_cond_register, .booleanInput),
                        (InputTitle.lengthDrop, .numericInput),
                        (InputTitle.spareTile, .numericInput)
                ]
                
            } else if moduleType == [._600X600_SEISMIC] {
                
                cells =
                    
                    [
                        (InputTitle.area, .numericInput),
                        (InputTitle._1200X300_t_bar_troffer, .booleanInput),
                        (InputTitle.largeOpenArea, .booleanInput),
                        (InputTitle._600X600_air_cond_register, .booleanInput),
                        (InputTitle.lengthDrop, .numericInput),
                        (InputTitle.spareTile, .numericInput)
                ]
                
            }
            
        case .CEILING_SUSPENSION :
            
            cells =
                [
                    (InputTitle.area, .numericInput),
                    (InputTitle._1200X300_t_bar_troffer, .booleanInput),
                    (InputTitle.largeOpenArea, .booleanInput),
                    (InputTitle.lengthDrop, .numericInput),
                    (InputTitle.spareTile, .numericInput)
            ]
            
        case .KLIK_STEEL_CEILING_SYSTEM :
            
            if moduleType == [._1200X600_REGULAR_H_PATTERN_KLIK_STEEL] || moduleType == [._600X600_KLIK_STEEL] || moduleType == [._600X600_HEAVY_DUTY_KLIK_STEEL] {
                cells =
                    [
                        (InputTitle.area, .numericInput),
                        (InputTitle._1200X300_t_bar_troffer, .booleanInput),
                        (InputTitle.largeOpenArea, .booleanInput),
                        (InputTitle._600X600_air_cond_register, .booleanInput),
                        (InputTitle.lengthDrop, .numericInput),
                        (InputTitle.spareTile, .numericInput)
                        
                ]
            } else if moduleType == [._1200X1200_KLIK_STEEL] {
                
                cells =
                    [
                        (InputTitle.area, .numericInput),
                        (InputTitle._1200X400_tiles, .booleanInput),
                        (InputTitle._1200X300_tiles, .booleanInput),
                        (InputTitle.c_spline, .booleanInput),
                        (InputTitle.t_spline, .booleanInput),
                        (InputTitle.largeOpenArea, .booleanInput),
                        (InputTitle.lengthDrop, .numericInput),
                        (InputTitle.spareTile, .numericInput)
                ]
            }
            
        default : break
            
        }
        
        return cells
        
    }
}






