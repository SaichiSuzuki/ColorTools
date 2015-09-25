//
//  ColorUtil.swift
//  ColorTools
//
//  Created by saichi on 2015/09/25.
//  Copyright (c) 2015年 saichi. All rights reserved.
//

import Foundation

/** 色変更ツール */
class ColorUtil {
    /** 明度変更
     * @param color: Hex color
     * @param per: Change parameter
     * @return New hex color
     */
    static func BrightnessUtil(color:String, par:Int) -> String{
        var result:NSString = "nil"
        // 16進数から10進数
        let code = color
        let scanner = NSScanner(string: code as NSString as String)
        var color:UInt32 = 0
        if(scanner.scanHexInt(&color)) {
            var r = (color & 0xFF0000) >> 16
            var g = (color & 0x00FF00) >> 8
            var b = (color & 0x0000FF)
            r += UInt32(par)
            g += UInt32(par)
            b += UInt32(par)
            result = NSString(format: "%02x%02x%02x", r, g, b)
        }
        return result as String
    }
}