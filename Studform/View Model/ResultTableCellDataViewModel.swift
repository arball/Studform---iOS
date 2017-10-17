//
//  TableCellDataViewModel.swift
//  Studform
//
//  Created by iOS development on 5/10/2017.
//  Copyright © 2017 iOS development. All rights reserved.
//

import Foundation

struct ResultTableCellData {
    
    //TODO: - Fix the rounding, view model should not handle data
    
    static func getTableCellData(result: Result) -> [ResultCellData] {
        
        var cellData: [ResultCellData]
        
        switch result {
            
        case let .Regal(regal) :
            
            cellData = [
                
                ResultCellData(title: "Main Tee", value: regal.mainTee.map{$0.rounded(.down)}),
                ResultCellData(title: "1200 Spacer", value: regal._1200_Spacer.map{$0.rounded(.down)}),
                ResultCellData(title: "C Spline", value: regal.c_spline.map{$0.rounded(.down)}),
                ResultCellData(title: "T Spline", value: regal.t_spline.map{$0.rounded(.down)}),
                ResultCellData(title: "600 Spacer", value: regal._600_Spacer.map{$0.rounded(.down)}),
                ResultCellData(title: "Hanging Rod", value: regal.hanging_rod.map{$0.rounded(.down)}),
                ResultCellData(title: "Suspension Clip", value: regal.suspensionClips.map{$0.rounded(.down)}),
                ResultCellData(title: "Anchor Clip", value: regal.anchorClips.map{$0.rounded(.down)}),
                ResultCellData(title: "Tiles", value: regal.tile.map{$0.rounded(.down)}),
                ResultCellData(title: "Wall Angle", value: regal.wallAngle.map{$0.rounded(.down)}),
                ResultCellData(title: "1200 X 400 Tiles", value: regal._1200X400_tile.map{$0.rounded(.down)}),
                ResultCellData(title: "1200 X 300 Tiles", value: regal._1200X300_tile.map{$0.rounded(.down)})
                
            ]
            
        case let .Premium(premium) :
            
            cellData = [
                
                ResultCellData(title: "Main Tee", value: premium.mainTee.map{$0.rounded(.down)}),
                ResultCellData(title: "1200 Spacer", value: premium._1200_Spacer.map{$0.rounded(.down)}),
                ResultCellData(title: "C Spline", value: premium.c_spline.map{$0.rounded(.down)}),
                ResultCellData(title: "T Spline", value: premium.t_spline.map{$0.rounded(.down)}),
                ResultCellData(title: "600 Spacer", value: premium._600_Spacer.map{$0.rounded(.down)}),
                ResultCellData(title: "Hanging Rod", value: premium.hanging_rod.map{$0.rounded(.down)}),
                ResultCellData(title: "Suspension Clip", value: premium.suspensionClips.map{$0.rounded(.down)}),
                ResultCellData(title: "Anchor Clip", value: premium.anchorClips.map{$0.rounded(.down)}),
                ResultCellData(title: "Tiles", value: premium.tile.map{$0.rounded(.down)}),
                ResultCellData(title: "Wall Angle", value: premium.wallAngle.map{$0.rounded(.down)}),
                ResultCellData(title: "1200 X 400 Tiles", value: premium._1200X400_tile.map{$0.rounded(.down)}),
                ResultCellData(title: "1200 X 300 Tiles", value: premium._1200X300_tile.map{$0.rounded(.down)})
                
            ]
            
        case let .Corporate(corporate) :
            cellData = [
                ResultCellData(title: "Main Tee", value: corporate.mainTee.map{$0.rounded(.down)}),
                ResultCellData(title: "1200 Spacers", value: corporate._1200_spacer.map{$0.rounded(.down)}),
                ResultCellData(title: "1350 Spacers", value: corporate._1350_spacer.map{$0.rounded(.down)}),
                ResultCellData(title: "1500 Spacers", value: corporate._1500_spacer.map{$0.rounded(.down)}),
                ResultCellData(title: "C Spline", value: corporate.c_spline.map{$0.rounded(.down)}),
                ResultCellData(title: "T Spline", value: corporate.t_spline.map{$0.rounded(.down)}),
                ResultCellData(title: "Wall Angle", value: corporate.wallAngle.map{$0.rounded(.down)}),
                ResultCellData(title: "Hanging Rod", value: corporate.hangingRod.map{$0.rounded(.down)}),
                ResultCellData(title: "Suspension Clip", value: corporate.suspensionClip.map{$0.rounded(.down)}),
                ResultCellData(title: "Anchor Clip", value: corporate.anchorClip.map{$0.rounded(.down)}),
                ResultCellData(title: "1350 X 450 Tiles", value: corporate._1350X450_tile.map{$0.rounded(.down)}),
                ResultCellData(title: "1200 X 400 Tiles", value: corporate._1200X400_tile.map{$0.rounded(.down)}),
                ResultCellData(title: "1200 X 300 Tiles", value: corporate._1200X300_tile.map{$0.rounded(.down)}),
                ResultCellData(title: "1500 X 500 Tiles", value: corporate._1500X500_tile.map{$0.rounded(.down)}),
                ResultCellData(title: "1500 X 300 Tiles", value: corporate._1500X300_tile.map{$0.rounded(.down)})
            ]
            
        case let .Oneway(oneway) :
            
            cellData = [
                
                ResultCellData(title: "Main Tee", value: oneway.mainTee.map{$0.rounded(.down)}),
                ResultCellData(title: "C Spline", value: oneway.c_spline.map{$0.rounded(.down)}),
                ResultCellData(title: "Interlocking T Spline", value: oneway.intermediate_t_spline.map{$0.rounded(.down)}),
                ResultCellData(title: "Intermediate T Spline", value: oneway.interlocking_t_spline.map{$0.rounded(.down)}),
                ResultCellData(title: "Wall Angle", value: oneway.wallAngle.map{$0.rounded(.down)}),
                ResultCellData(title: "Hanging Rod", value: oneway.hangingRod.map{$0.rounded(.down)}),
                ResultCellData(title: "Suspension Clip", value: oneway.suspensionClip.map{$0.rounded(.down)}),
                ResultCellData(title: "Anchor Clip", value: oneway.anchorClip.map{$0.rounded(.down)}),
                ResultCellData(title: "Tiles", value: oneway.tiles.map{$0.rounded(.down)})
                
            ]
            
        case let .Seismic(seismic) :
            
            cellData = [
                ResultCellData(title: "Main Tee", value: seismic.mainTee.map{$0.rounded(.down)}),
                ResultCellData(title: "1200 Spacer", value: seismic._1200_spacer.map{$0.rounded(.down)}),
                ResultCellData(title: "600 Spacer", value: seismic._600_spacer.map{$0.rounded(.down)}),
                ResultCellData(title: "hanging Rod", value: seismic.hangingRod.map{$0.rounded(.down)}),
                ResultCellData(title: "Suspension Clips", value: seismic.suspensionClip.map{$0.rounded(.down)}),
                ResultCellData(title: "Anchor Clips", value: seismic.anchorClip.map{$0.rounded(.down)}),
                ResultCellData(title: "Tiles", value: seismic.tiles.map{$0.rounded(.down)}),
                ResultCellData(title: "Wall Angle", value: seismic.wallAngle.map{$0.rounded(.down)}),
                ResultCellData(title: "Fixed Wall Angle", value: seismic.fixedWallAngle.map{$0.rounded(.down)}),
                ResultCellData(title: "Floating Wall Angle", value: seismic.floatingWallAngle.map{$0.rounded(.down)}),
                ResultCellData(title: "Seismic Clips", value: seismic.seismicClips.map{$0.rounded(.down)}),
                ResultCellData(title: "Fixed Wall Angle Bracket", value: seismic.fixedWallAngleBracket.map{$0.rounded(.down)}),
                ResultCellData(title: "Float Wall Angle Bracket", value: seismic.floatWallAngleBracket.map{$0.rounded(.down)}),
                ResultCellData(title: "Bracing Points", value: seismic.bracingPoint.map{$0.rounded(.down)})
            ]
            
        case let .Concelead(conceal) :
            
            cellData = [
                ResultCellData(title: "Main Tee", value: conceal.mainTee.map{$0.rounded(.down)}),
                ResultCellData(title: "Interlocking T Splines", value: conceal.interlocking_t_spline.map{$0.rounded(.down)}),
                ResultCellData(title: "Wall Angle", value: conceal.wallAngle.map{$0.rounded(.down)}),
                ResultCellData(title: "Hanging Rod", value: conceal.hangingRod.map{$0.rounded(.down)}),
                ResultCellData(title: "Suspension Clips", value: conceal.suspensionClips.map{$0.rounded(.down)}),
                ResultCellData(title: "Anchor Clips", value: conceal.anchorClips.map{$0.rounded(.down)}),
                ResultCellData(title: "Tiles", value: conceal.tiles.map{$0.rounded(.down)})
                
            ]
            
        case let .KlikSteel(steel) :
            
            cellData = [
            
                ResultCellData(title: "Main Tee", value: steel.mainTee.map{$0.rounded(.down)}),
                ResultCellData(title: "1200 Spacer", value: steel._1200_Spacer.map{$0.rounded(.down)}),
                ResultCellData(title: "C Spline", value: steel.c_spline.map{$0.rounded(.down)}),
                ResultCellData(title: "T Spline", value: steel.t_spline.map{$0.rounded(.down)}),
                ResultCellData(title: "600 Spacer", value: steel._600_Spacer.map{$0.rounded(.down)}),
                ResultCellData(title: "Hanging Rod", value: steel.hanging_rod.map{$0.rounded(.down)}),
                ResultCellData(title: "Suspension Clip", value: steel.suspensionClips.map{$0.rounded(.down)}),
                ResultCellData(title: "Anchor Clip", value: steel.anchorClips.map{$0.rounded(.down)}),
                ResultCellData(title: "Tiles", value: steel.tile.map{$0.rounded(.down)}),
                ResultCellData(title: "Wall Angle", value: steel.wallAngle.map{$0.rounded(.down)}),
                ResultCellData(title: "1200 X 400 Tiles", value: steel._1200X400_tile.map{$0.rounded(.down)}),
                ResultCellData(title: "1200 X 300 Tiles", value: steel._1200X300_tile.map{$0.rounded(.down)})
                
            ]
            
        default:
            fatalError() // TODO: - implement something better
        }
        
        
        return cellData
    }
    
    
    
    
}
