//
//  Date+LPDBExtension.swift
//  KZWFoundationSwfit
//
//  Created by yang ou on 2019/3/14.
//

import Foundation

public extension Date {
    
    //MARK:- 格式转换
    public func toString(format: String = "yyyy-MM-dd HH:mm") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = NSTimeZone.local
        return dateFormatter.string(from: self)
    }
    
    // MARK:- 获取当前时间
    public static func currentDate(format: String) -> String {
        
        let currentdate = Date()
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = format
        
        let customDate = dateformatter.string(from: currentdate)
        
        return customDate
    }
    
    public static func date(num: Int, format: String) -> String {
        
        let timeInterval:TimeInterval = TimeInterval(num / 1000)
        let date = Date(timeIntervalSince1970: timeInterval)
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = format
        
        return dateformatter.string(from: date)
    }
    
}
