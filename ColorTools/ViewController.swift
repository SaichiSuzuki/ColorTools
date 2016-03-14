//
//  ViewController.swift
//  ColorTools
//
//  Created by saichi on 2015/09/25.
//  Copyright (c) 2015年 saichi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var label:UILabel = UILabel()
    var button: UIButton = UIButton()
//    var color:String = "AE273D" //色例
    var color:String = "000000" //色例
    var parameter:Int = 10 //明度変更パラメータ
    var testCount = 0
    override func viewDidLoad() {
        super.viewDidLoad()
//        color = ColorUtil.getGrayscale(1)
//        color = ColorUtil.ChangeBrightUtil(color, param: -50, kind: 0)
        // 表示用ラベル
        label.frame = CGRect(x: 30.0, y: 30.0, width:200.0, height:200.0)
        label.text = "現在の色\(color)"
        self.view.addSubview(label)
        // 変換用ボタン
        button.frame = CGRect(x: 160, y: 30, width: 100, height: 50)
        button.setTitle("change", forState: .Normal)
        button.layer.backgroundColor = UIColor.hexStr("#\(color)", alpha: 1.0).CGColor
        button.addTarget(self, action: "btnAction:", forControlEvents:.TouchUpInside)
        self.view.addSubview(button)
        
        let testLabel:UILabel = UILabel()
        testLabel.frame = CGRect(x: 100, y: 100, width: 100, height: 100);
        testLabel.text = "aaa"
        self.view.addSubview(testLabel)
    }

    func btnAction(sender: UIButton){
        testCount += 5
        color = ColorUtil.getGrayscale(testCount)
        println(testCount)
//      color = ColorUtil.ChangeBrightUtil(color, param: parameter)
//        color = ColorUtil.ChangeBrightUtil(color, param: -5, kind: 0)
        color = ColorUtil.ChangeBrightUtil(color, param: -testCount/5, kind: 1)
//        println(ColorUtil.hexToRGB(color))
        label.text = ("現在の色\(color)")
        label.text = ("現在の色\(ColorUtil.hexToRGB(color))")
        button.layer.backgroundColor = UIColor.hexStr("#\(color)", alpha: 1.0).CGColor
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

