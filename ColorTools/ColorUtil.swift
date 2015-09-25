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
            // 正なら255超えないように
            if(par>0){
                if(Int(r)+par>255){
                    r = 255
                }else{
                    r += UInt32(par)
                }
                if(Int(g)+par>255){
                    g = 255
                }else{
                    g += UInt32(par)
                }
                if(Int(b)+par>255){
                    b = 255
                }else{
                    b += UInt32(par)
                }
            }
            // 負なら0超えないように
            else{
                if(Int(r)+par<0){
                    r = 0
                }else{
                    r = UInt32(Int(r) + par)
                }
                if(Int(g)+par<0){
                    g = 0
                }else{
                    g = UInt32(Int(g) + par)
                }
                if(Int(b)+par<0){
                    b = 0
                }else{
                    b = UInt32(Int(b) + par)
                }
            }
            result = NSString(format: "%02x%02x%02x", r, g, b)
        }
        return result as String
    }
}