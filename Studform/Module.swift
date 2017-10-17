//
//  ModuleTypes.swift
//  Studform
//
//  Created by iOS development on 9/8/2017.
//  Copyright © 2017 iOS development. All rights reserved.
//

import Foundation

typealias titles = (main: String, sub: String)

enum Modules {
    
    // MARK: - Main ceiling types
    
    case MAINMENU
    case KWIKLOC_REGAL
    case KWIKLOC_PREMIUM
    case KWIKLOC_CORPORATE
    case ONEWAY_EXPOSED
    case KWIKLOC_SEISMIC
    case CEILING_SUSPENSION
    case KLIK_STEEL_CEILING_SYSTEM
    
    //MARK: REGAL
    
    case _1200X600_REGULAR_H_PATTERN_REGAL
    case _1200X1200_REGAL
    case _600X600_REGAL
    case _600X600_HEAVY_DUTY_REGAL
    
    //MARK: - PREMIUM
    
    case _1200X600_REGULAR_H_PATTERN_PREMIUM
    case _1200X1200_PREMIUM
    case _600X600_PREMIUM
    case _600X600_HEAVY_DUTY_PREMIUM
    
    //MARK: - CORPORATE
    
    case _1200X1200MM
    case _1350X1350MM
    case _1500X1500MM
    
    //MARK: - ONEWAY EXPOSE
    
    case _24MM_T_BAR_EXPOSED
    case _32MM_TOPHAT_EXPOSED
    
    case _1200X400_TILE_SIZE_T_BAR_EXPOSED
    case _1350X450_TILE_SIZE_T_BAR_EXPOSED
    
    case _1200X400_TILE_SIZE_TOPHAT_EXPOSED
    case _1350X450_TILE_SIZE_TOPHAT_EXPOSED
    
    //MARK: - STUDFORM CEILING
    
    case _600MM_FURRING_CHANNEL
    case _450MM_FURRING_CHANNEL
    
    //MARK: - SEISMIC
    
    case _1200X600_REGULAR_H_PATTERN_SEISMIC
    case _600X600_SEISMIC
    
    //MARK: - KLIK STEEL
    
    case _1200X600_REGULAR_H_PATTERN_KLIK_STEEL
    case _1200X1200_KLIK_STEEL
    case _600X600_KLIK_STEEL
    case _600X600_HEAVY_DUTY_KLIK_STEEL

    static func description(module: Modules) -> titles {
        
        switch module {
        case .MAINMENU : return ("", "")
        case .KWIKLOC_REGAL : return ("KWIKLOC Regal", "24mm Alum. T-bar")
        case .KWIKLOC_PREMIUM : return ("KWIKLOC Premium", "15mm Alum. T-bar")
        case .KWIKLOC_CORPORATE : return ("KWIKLOC Corporate", "32mm Mitred Top Hat")
        case .ONEWAY_EXPOSED : return ("KWIKLOC ONE WAY", "Alum One Way Exposed Systems")
        case .KWIKLOC_SEISMIC : return ("KWIKLOC SEISMIC", "24mm Alum. T-Bar")
        case .CEILING_SUSPENSION : return ("STUDFORM CEILING", "Concealed suspension system")
        case .KLIK_STEEL_CEILING_SYSTEM : return ("KLIK STEEL", "Grid Ceiling System")
            
        //MARK: - REGAL
            
        case . _1200X600_REGULAR_H_PATTERN_REGAL : return ("1200 X 600", "With Regular or H Pattern")
        case ._1200X1200_REGAL : return ("1200 X 1200", "")
        case ._600X600_REGAL : return ("600 X 600", "")
        case ._600X600_HEAVY_DUTY_REGAL : return ("600 X 600", "Heavy Duty (Main Tees at 600 Centers)")
            
        //MARK: - PREMIUM
            
        case . _1200X600_REGULAR_H_PATTERN_PREMIUM : return ("1200 X 600", "With Regular or H Pattern")
        case ._1200X1200_PREMIUM : return ("1200 X 1200", "")
        case ._600X600_PREMIUM : return ("600 X 600", "")
        case ._600X600_HEAVY_DUTY_PREMIUM : return ("600 X 600", "Heavy Duty (Main Tees at 600 Centers)")
            
        //MARK: - CORPORATE
            
        case ._1200X1200MM : return ("1200 X 1200 mm", "")
        case ._1350X1350MM : return ("1350 x 1350 mm", "")
        case ._1500X1500MM : return ("1500 X 1500 mm", "")
            
        //MARK: - ONEWAY EXPOSE
            
        case ._24MM_T_BAR_EXPOSED : return ("24 mm", "T Bar One Way Exposed")
        case ._32MM_TOPHAT_EXPOSED : return ("32 mm", "T Bar One Way Exposed")
            
        case ._1200X400_TILE_SIZE_T_BAR_EXPOSED : return ("1200 X 400", "Tile Size/Module")
        case ._1350X450_TILE_SIZE_T_BAR_EXPOSED : return ("1350 X 450", "Tile Size/Module")
            
        case ._1200X400_TILE_SIZE_TOPHAT_EXPOSED : return ("1200 X 400", "Tile Size/Module")
        case ._1350X450_TILE_SIZE_TOPHAT_EXPOSED : return ("1350 X 450", "Tile Size/Module")
            
        //MARK: - STUDFORM CEILING
            
        case ._600MM_FURRING_CHANNEL : return ("600 mm", "Furring Channel")
        case ._450MM_FURRING_CHANNEL : return ("450 mm", "Furring Channel")
            
        //MARK: - SEISMIC
            
        case . _1200X600_REGULAR_H_PATTERN_SEISMIC : return ("1200 X 600", "With Regular or H Pattern")
        case ._600X600_SEISMIC : return ("600 X 600", "")
            
        //MARK: - KLIK STEEL
            
        case . _1200X600_REGULAR_H_PATTERN_KLIK_STEEL: return ("1200 X 600", "With Regular or H Pattern")
        case ._1200X1200_KLIK_STEEL : return ("1200 X 1200", "")
        case ._600X600_KLIK_STEEL : return ("600 X 600", "")
        case ._600X600_HEAVY_DUTY_KLIK_STEEL : return ("600 X 600", "Heavy Duty (Main Tees at 600 Centers)")
            
        }
    }
    
    var titleString: String {
        
        switch self {
            
        case .MAINMENU : return "Main Menu"
        case .KWIKLOC_REGAL : return "KWIKLOC Regal"
        case .KWIKLOC_PREMIUM : return "KWIKLOC Premium"
        case .KWIKLOC_SEISMIC : return "KWIKLOC Seismic"
        case .KWIKLOC_CORPORATE : return "KWIKLOC Corporate"
        case .ONEWAY_EXPOSED : return "One way Exposed"
        case .CEILING_SUSPENSION : return "Ceiling Suspension"
        case .KLIK_STEEL_CEILING_SYSTEM : return "Ceiling System"
            
        case ._1200X600_REGULAR_H_PATTERN_REGAL : return "1200 X 600 Regular H Pattern"
        case ._1200X1200_REGAL : return "1200 X 1200"
        case ._600X600_REGAL : return "600 X 600"
        case ._600X600_HEAVY_DUTY_REGAL : return "600 X 600 Heavy Duty"
        
        case ._1200X600_REGULAR_H_PATTERN_PREMIUM : return "1200 X 600 Regular H Pattern"
        case ._1200X1200_PREMIUM : return "1200 X 1200"
        case ._600X600_PREMIUM : return "600 X 600"
        case ._600X600_HEAVY_DUTY_PREMIUM : return "600 X 600 Heavy Duty"
            
        case ._1200X1200MM : return "1200 X 1200 mm"
        case ._1350X1350MM : return "1350 X 1350 mm"
        case ._1500X1500MM : return "1500 X 1500 mm"
            
        case ._24MM_T_BAR_EXPOSED : return "24 mm T Bar"
        case ._32MM_TOPHAT_EXPOSED : return "32 mm Top Hat"
            
        case ._1200X400_TILE_SIZE_T_BAR_EXPOSED : return "1200 X 400 Tile Size T Bar"
        case ._1350X450_TILE_SIZE_T_BAR_EXPOSED : return "1350 X 450 Tile Size T Bar"
            
        case ._1200X400_TILE_SIZE_TOPHAT_EXPOSED : return "1200 X 400 Tile Size Top Hat"
        case ._1350X450_TILE_SIZE_TOPHAT_EXPOSED : return "1350 X 450 Tile Size Top Hat"
            
        case ._600MM_FURRING_CHANNEL : return "600 mm Furring Channel"
        case ._450MM_FURRING_CHANNEL : return "450 mm Furring Channel"
            
            //MARK: - SEISMIC
            
        case ._1200X600_REGULAR_H_PATTERN_SEISMIC : return "1200 X 600 Regular H Pattern"
        case ._600X600_SEISMIC : return "600 X 600"
            
            //MARK: - KLIK STEEL
            
        case ._1200X600_REGULAR_H_PATTERN_KLIK_STEEL : return "1200 X 600 Regular H Pattern"
        case ._1200X1200_KLIK_STEEL : return "1200 X 1200"
        case ._600X600_KLIK_STEEL : return "600 X 600"
        case ._600X600_HEAVY_DUTY_KLIK_STEEL : return "600 X 600 Heavy Duty"

            
        }

        
    }
    
}


















