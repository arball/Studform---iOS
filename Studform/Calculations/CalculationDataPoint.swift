//
//  UserInputData.swift
//  Studform
//
//  Created by iOS development on 27/9/2017.
//  Copyright © 2017 iOS development. All rights reserved.
//

import Foundation

// This struct is responible for capturing all user's input and segregate them into String and Bool. The numeric inputs from the user will be captured as String, but will later turned into a calculatable type (Double)

struct CalculatorDataPoint {
    
    var area: String?
    var _1200X300_TBarTrofferLightFitting: Bool?
    var _1200X1200_TBarTrofferLightFitting: Bool?
    var _600X600_AirCondRegister: Bool?
    var _1200X400Tiles_input: Bool?
    var _1200X300Tiles_input: Bool?
    var _1350X450Tiles_input: Bool?
    var _1500X500Tiles_input: Bool?
    var _1500X300Tiles_input: Bool?
    var c_spline_input: Bool?
    var t_spline_input: Bool?
    var interlocking_t_spline: Bool?
    var intermediate_t_spline: Bool?
    var largeOpenArea: Bool?
    var lengthDrop: String?
    var spareTile: String?
    
    static func map(_ data: [String: Any]) -> CalculatorDataPoint {
        var point = CalculatorDataPoint()
        
        point.area = data["Area/m2"] as? String ?? ""
        point._1200X1200_TBarTrofferLightFitting = data[InputTitle._1200X1200_t_bar_troffer] as? Bool ?? nil
        point._1200X300_TBarTrofferLightFitting = data[InputTitle._1200X300_t_bar_troffer] as? Bool ?? nil
        
        point._600X600_AirCondRegister = data[InputTitle._600X600_air_cond_register] as? Bool ?? nil
        point._1200X400Tiles_input = data[InputTitle._1200X400_tiles] as? Bool ?? nil
        point._1200X300Tiles_input = data[InputTitle._1200X300_tiles] as? Bool ?? nil
        point._1350X450Tiles_input = data[InputTitle._1350X450_tiles] as? Bool ?? nil
        point._1500X500Tiles_input = data[InputTitle._1500X500_tiles] as? Bool ?? nil
        point._1500X300Tiles_input = data[InputTitle._1500X300_tiles] as? Bool ?? nil
        point.c_spline_input = data[InputTitle.c_spline] as? Bool ?? nil
        point.t_spline_input = data[InputTitle.t_spline] as? Bool ?? nil
        point.interlocking_t_spline = data[InputTitle.interlocking_t_spline] as? Bool ?? nil
        point.intermediate_t_spline = data[InputTitle.intermediate_t_spline] as? Bool ?? nil
        point.lengthDrop = data[InputTitle.lengthDrop] as? String ?? ""
        point.largeOpenArea = data[InputTitle.largeOpenArea] as? Bool ?? nil
        point.spareTile = data[InputTitle.spareTile] as? String ?? ""
    
        return point
    
    }
    
}























