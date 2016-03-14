//
//  ColorUtil.swift
//  ColorTools
//
//  Created by saichi on 2015/09/25.
//  Copyright (c) 2015年 saichi. All rights reserved.
//

import Foundation

class ColorUtil {
    /** change bright
    * @param color: Hex color
    * @param param: Change parameter
    * @return New hex color
    */
    static func ChangeBrightUtil(color:String, param:Int) -> String{
        var result:NSString = "nil"
        // 16進数から10進数
        let code = color
        // remove head #
        if color.substringToIndex(color.startIndex.successor()) == "#" {
            code = (color as NSString).substringFromIndex(1)
        }
        let scanner = NSScanner(string: code as NSString as String)
        var color:UInt32 = 0
        if(scanner.scanHexInt(&color)) {
            var r = (color & 0xFF0000) >> 16
            var g = (color & 0x00FF00) >> 8
            var b = (color & 0x0000FF)
            // 正なら255超えないように
            if(param>0){
                if(Int(r)+param>255){
                    r = 255
                }else{
                    r += UInt32(param)
                }
                if(Int(g)+param>255){
                    g = 255
                }else{
                    g += UInt32(param)
                }
                if(Int(b)+param>255){
                    b = 255
                }else{
                    b += UInt32(param)
                }
            }
                // 負なら0超えないように
            else{
                if(Int(r)+param<0){
                    r = 0
                }else{
                    r = UInt32(Int(r) + param)
                }
                if(Int(g)+param<0){
                    g = 0
                }else{
                    g = UInt32(Int(g) + param)
                }
                if(Int(b)+param<0){
                    b = 0
                }else{
                    b = UInt32(Int(b) + param)
                }
            }
            result = NSString(format: "%02x%02x%02x", r, g, b)
        }
        return result as String
    }
    /** change bright (one color)
    * @param color: Hex color
    * @param param: Change parameter
    * @param kind: 0:R 1:G 2:B
    * @return New hex color
    */
    static func ChangeBrightUtil(color:String, param:Int, kind:Int) -> String{
        var result:NSString = "nil"
        // 16進数から10進数
        let code = color
        let scanner = NSScanner(string: code as NSString as String)
        var color:UInt32 = 0
        if(scanner.scanHexInt(&color)) {
            var r = (color & 0xFF0000) >> 16
            var g = (color & 0x00FF00) >> 8
            var b = (color & 0x0000FF)
            // 正なら255超えないように
            if(param>0){
                if(kind == 0){
                    if(Int(r)+param>255){
                        r = 255
                    }else{
                        r += UInt32(param)
                    }
                }else if(kind == 1){
                    if(Int(g)+param>255){
                        g = 255
                    }else{
                        g += UInt32(param)
                    }
                }
                else if(kind == 2){
                    if(Int(b)+param>255){
                        b = 255
                    }else{
                        b += UInt32(param)
                    }
                }
            }
                // 負なら0超えないように
            else{
                if(kind == 0){
                    if(Int(r)+param<0){
                        r = 0
                    }else{
                        r = UInt32(Int(r) + param)
                    }
                }else if(kind == 1){
                    if(Int(g)+param<0){
                        g = 0
                    }else{
                        g = UInt32(Int(g) + param)
                    }
                }else if(kind == 2){
                    if(Int(b)+param<0){
                        b = 0
                    }else{
                        b = UInt32(Int(b) + param)
                    }
                }
            }
            result = NSString(format: "%02x%02x%02x", r, g, b)
        }
        return result as String
    }

    /**
    番号を渡すとグレースケールでもらう
    - parameter num: num
    - returns: color
    */
    static func getGrayscale(num:Int) -> String{
        return NSString(format: "%02x%02x%02x", num, num, num) as String
    }
    
    /**
    hex to rgb
    - parameter color: hex
    - returns: rgb
    */
    static func hexToRGB(color:String) -> [Int]{
        let code = color
        var rgb:[Int] = []
        let scanner = NSScanner(string: code as String)
        var color:UInt32 = 0
        if(scanner.scanHexInt(&color)) {
            let r = (color & 0xFF0000) >> 16
            let g = (color & 0x00FF00) >> 8
            let b = (color & 0x0000FF)
            rgb.append(Int(r))
            rgb.append(Int(g))
            rgb.append(Int(b))
        }
        return rgb
    }
    
}
