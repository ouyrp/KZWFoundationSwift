//
//  UIDevice+KZWExtension.swift
//  KZWFoundationSwfit
//
//  Created by yang ou on 2019/3/14.
//

import Foundation
import UIKit

public extension UIDevice {
    
    public static let infoDictionary = Bundle.main.infoDictionary
    //App 名称
    public static let appDisplayName: String = Bundle.main.infoDictionary!["CFBundleDisplayName"] as! String
    // Bundle Identifier
    public static let bundleIdentifier:String = Bundle.main.bundleIdentifier!
    // App 版本号
    public static let appVersion:String = Bundle.main.infoDictionary! ["CFBundleShortVersionString"] as! String
    //Bulid 版本号
    public static let buildVersion : String = Bundle.main.infoDictionary! ["CFBundleVersion"] as! String
    //ios 版本
    public static let iOSVersion: String = UIDevice.current.systemVersion
    //设备 udid
    public static let identifierNumber = UIDevice.current.identifierForVendor!.uuidString
    //设备名称
    public static let systemName = UIDevice.current.systemName
    // 设备型号
    public static let model = UIDevice.current.model
    //设备区域化型号
    public static let localizedModel = UIDevice.current.localizedModel
    
    // 屏幕宽高
    public static let kzwWidth = UIScreen.main.bounds.width
    public static let kzwHeight = UIScreen.main.bounds.height
    
    // block
    public typealias CommonBlock = (_ result: Any?) -> ()
    
    // 比例计算
    public func Scale(num: Int) -> CGFloat {
        return UIScreen.main.bounds.width / 375.0 * CGFloat(num)
    }
    
    // 设置字体（也可以在这里适配字体）
    public func font(size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size)
    }
    
}
