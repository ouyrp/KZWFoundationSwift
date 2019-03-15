//
//  Array+KZWExtension.swift
//  KZWFoundationSwfit
//
//  Created by yang ou on 2019/3/14.
//

import Foundation

public extension Array {
    // MARK:- 数组转json
    public var toJson: String {
        if (!JSONSerialization.isValidJSONObject(self)) {
            print("无法解析出JSONString")
            return ""
        }
        let data : NSData! = try? JSONSerialization.data(withJSONObject: self, options: []) as NSData!
        let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
        return JSONString! as String
    }
}
