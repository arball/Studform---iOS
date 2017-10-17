//
//  ModuleData.swift
//  Studform
//
//  Created by iOS development on 9/8/2017.
//  Copyright © 2017 iOS development. All rights reserved.
//

import Foundation

// This is using the data structure to construct the menu from ground up, this is purely for constructing the menu, the descriptions and title string are handled by Module.swift

struct MenuStructure {
    
    static var structure: Node {
        
        // All nodes
        
        // First layour nodes, major ceiling modules
        
        let mainMenu = Node(module: .MAINMENU)
        let KWIKLOC_REGAL = Node(module: .KWIKLOC_REGAL)
        let KWIKLOC_PREMIUM = Node(module: .KWIKLOC_PREMIUM)
        let KWIKLOC_CORPORATE = Node(module: .KWIKLOC_CORPORATE)
        let ONEWAY_EXPOSED = Node(module: .ONEWAY_EXPOSED)
        let KWIKLOC_SEISMIC = Node(module: .KWIKLOC_SEISMIC)
        let CEILING_SUSPENSION = Node(module: .CEILING_SUSPENSION)
        let KLIK_STEEL_CEILING_SYSTEM = Node(module: .KLIK_STEEL_CEILING_SYSTEM)
        
        // Second layour nodes, sub modules
        
        //MARK: - REGAL
        
        let _1200X600_REGULAR_H_PATTERN_REGAL = Node(module: ._1200X600_REGULAR_H_PATTERN_REGAL)
        let _1200X1200_REGAL = Node(module: ._1200X1200_REGAL)
        let _600X600_REGAL = Node(module: ._600X600_REGAL)
        let _600X600_HEAVY_DUTY_REGAL = Node(module: ._600X600_HEAVY_DUTY_REGAL)
        
        //MARK: - PREMIUM
        
        let _1200X600_REGULAR_H_PATTERN_PREMIUM = Node(module: ._1200X600_REGULAR_H_PATTERN_PREMIUM)
        let _1200X1200_PREMIUM = Node(module: ._1200X1200_PREMIUM)
        let _600X600_PREMIUM = Node(module: ._600X600_PREMIUM)
        let _600X600_HEAVY_DUTY_PREMIUM = Node(module: ._600X600_HEAVY_DUTY_PREMIUM)
        
        //MARK: - CORPORATE
        
        let _1200X1200MM = Node(module: ._1200X1200MM)
        let _1350X1350MM = Node(module: ._1350X1350MM)
        let _1500X1500MM = Node(module: ._1500X1500MM)
        
        //MARK: - ONEWAY EXPOSED
        
        let _24MM_T_BAR_EXPOSED = Node(module: ._24MM_T_BAR_EXPOSED)
        let _32MM_TOPHAT_EXPOSED = Node(module: ._32MM_TOPHAT_EXPOSED)

        
        let _1200X400_TILE_SIZE_TOPHAT_EXPOSED = Node(module: ._1200X400_TILE_SIZE_TOPHAT_EXPOSED)
        let _1350X450_TILE_SIZE_TOPHAT_EXPOSED = Node(module: ._1350X450_TILE_SIZE_TOPHAT_EXPOSED)
        
        let _1200X400_TILE_SIZE_T_BAR_EXPOSED = Node(module: ._1200X400_TILE_SIZE_T_BAR_EXPOSED)
        let _1350X450_TILE_SIZE_T_BAR_EXPOSED = Node(module: ._1350X450_TILE_SIZE_T_BAR_EXPOSED)
        
        //MARK: - STUDFORM CEILING
        
        let _600MM_FURRING_CHANNEL = Node(module: ._600MM_FURRING_CHANNEL)
        let _450MM_FURRING_CHANNEL = Node(module: ._450MM_FURRING_CHANNEL)
        
        //MARK: - SEISMIC
        
        let _1200X600_REGULAR_H_PATTERN_SEISMIC = Node(module: ._1200X600_REGULAR_H_PATTERN_SEISMIC)
        let _600X600_SEISMIC = Node(module: ._600X600_SEISMIC)
        
        //MARK: - KLIK STEEL
        
        let _1200X600_REGULAR_H_PATTERN_KLIK_STEEL = Node(module: ._1200X600_REGULAR_H_PATTERN_KLIK_STEEL)
        let _1200X1200_KLIK_STEEL = Node(module: ._1200X1200_KLIK_STEEL)
        let _600X600_KLIK_STEEL = Node(module: ._600X600_KLIK_STEEL)
        let _600X600_HEAVY_DUTY_KLIK_STEEL = Node(module: ._600X600_HEAVY_DUTY_KLIK_STEEL)
        
        // First layour - connections
        
        mainMenu.appendNode(node: KWIKLOC_REGAL)
        mainMenu.appendNode(node: KWIKLOC_PREMIUM)
        mainMenu.appendNode(node: KWIKLOC_CORPORATE)
        mainMenu.appendNode(node: ONEWAY_EXPOSED)
        mainMenu.appendNode(node: KWIKLOC_SEISMIC)
        mainMenu.appendNode(node: CEILING_SUSPENSION)
        mainMenu.appendNode(node: KLIK_STEEL_CEILING_SYSTEM)
        
        // Second layour - connections
        
        KWIKLOC_REGAL.appendNode(node: _1200X600_REGULAR_H_PATTERN_REGAL)
        KWIKLOC_REGAL.appendNode(node: _1200X1200_REGAL)
        KWIKLOC_REGAL.appendNode(node: _600X600_REGAL)
        KWIKLOC_REGAL.appendNode(node: _600X600_HEAVY_DUTY_REGAL)
        
        KWIKLOC_PREMIUM.appendNode(node: _1200X600_REGULAR_H_PATTERN_PREMIUM)
        KWIKLOC_PREMIUM.appendNode(node: _1200X1200_PREMIUM)
        KWIKLOC_PREMIUM.appendNode(node: _600X600_PREMIUM)
        KWIKLOC_PREMIUM.appendNode(node: _600X600_HEAVY_DUTY_PREMIUM)
        
        KWIKLOC_CORPORATE.appendNode(node: _1200X1200MM)
        KWIKLOC_CORPORATE.appendNode(node: _1350X1350MM)
        KWIKLOC_CORPORATE.appendNode(node: _1500X1500MM)
        
        ONEWAY_EXPOSED.appendNode(node: _24MM_T_BAR_EXPOSED)
        ONEWAY_EXPOSED.appendNode(node: _32MM_TOPHAT_EXPOSED)
        
        KWIKLOC_SEISMIC.appendNode(node: _1200X600_REGULAR_H_PATTERN_SEISMIC)
        KWIKLOC_SEISMIC.appendNode(node: _600X600_SEISMIC)
        
        CEILING_SUSPENSION.appendNode(node: _600MM_FURRING_CHANNEL)
        CEILING_SUSPENSION.appendNode(node: _450MM_FURRING_CHANNEL)
        
        KLIK_STEEL_CEILING_SYSTEM.appendNode(node: _1200X600_REGULAR_H_PATTERN_KLIK_STEEL)
        KLIK_STEEL_CEILING_SYSTEM.appendNode(node: _1200X1200_KLIK_STEEL)
        KLIK_STEEL_CEILING_SYSTEM.appendNode(node: _600X600_KLIK_STEEL)
        KLIK_STEEL_CEILING_SYSTEM.appendNode(node: _600X600_HEAVY_DUTY_KLIK_STEEL)
        
        // Third layour
        
        _24MM_T_BAR_EXPOSED.appendNode(node: _1200X400_TILE_SIZE_T_BAR_EXPOSED)
        _24MM_T_BAR_EXPOSED.appendNode(node: _1350X450_TILE_SIZE_T_BAR_EXPOSED)
    
        _32MM_TOPHAT_EXPOSED.appendNode(node: _1350X450_TILE_SIZE_TOPHAT_EXPOSED)
        _32MM_TOPHAT_EXPOSED.appendNode(node: _1200X400_TILE_SIZE_TOPHAT_EXPOSED)
        
        return mainMenu
    }
}



