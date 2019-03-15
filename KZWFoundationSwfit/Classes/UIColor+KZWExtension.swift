//
//  File.swift
//  KZWFoundationSwfit
//
//  Created by yang ou on 2019/3/14.
//

import Foundation
import UIKit

public extension UIColor {
    
    public convenience init(hex: Int, alpha: CGFloat) {
        let r = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(hex & 0x0000FF) / 255.0
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
    
    public convenience init(hexString str: String, alpha: CGFloat) {
        let range = NSMakeRange(0, str.count)
        let hex = (str as NSString).replacingOccurrences(of: "[^0-9a-fA-F]", with: "", options: .regularExpression, range: range)
        var color: UInt32 = 0
        Scanner(string: hex).scanHexInt32(&color)
        self.init(hex: Int(color), alpha: alpha)
    }
    
    public class var randomColor:UIColor{
        get
        {
            let red = CGFloat(arc4random()%256)/255.0
            let green = CGFloat(arc4random()%256)/255.0
            let blue = CGFloat(arc4random()%256)/255.0
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
    }
}

