//
//  File.swift
//  KZWFoundationSwfit
//
//  Created by yang ou on 2019/3/14.
//

import Foundation
import UIKit
import CommonCrypto

public extension String {
    //根据开始位置和长度截取字符串
    public func subString(start:Int, length:Int = -1) -> String {
        var len = length
        if len == -1 {
            len = self.count - start
        }
        let st = self.index(startIndex, offsetBy:start)
        let en = self.index(st, offsetBy:len)
        return String(self[st ..< en])
    }
    
    //正则表达式
    public func conform(regex: String) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
    }
    
    //检测是否存在某子字符串(无视大小写)
    public func hasSubString(string: String) -> Bool {
        return nil != self.range(of: string, options: String.CompareOptions.caseInsensitive, range: nil, locale: nil)
    }
    
    //替换某个子字符串为另一字符串
    public func replace(string: String, with: String) -> String {
        return self.replacingOccurrences(of: string, with: with, options: String.CompareOptions.literal, range: nil)
    }
    
    //替换前缀
    public func replacePrefix(string: String, with: String) -> String {
        if self.hasPrefix(string) {
            return with + String(self.dropFirst(string.count))
        }
        return self
    }
    
    //替换尾缀
    public func replaceSuffix(string: String, with: String) -> String {
        if self.hasSuffix(string) {
            return String(self.dropLast(string.count)) + with
        }
        return self
    }
    
    //移除某个子串
    public func remove(string: String) -> String {
        return self.replace(string: string, with: "")
    }
    
    //移除某个前缀
   public func removePrefix(string: String) -> String {
        return self.replacePrefix(string: string, with: "")
    }
    
    //移除某个尾缀
    public func removeSuffix(string: String) -> String {
        return self.replaceSuffix(string: string, with: "")
    }
    
    //判断是否是URL地址
    public func isURL() ->Bool{
        var result1 = false
        var result2 = false
        let urlRegex1 = "^https://([\\w-]+\\.)+[\\w-]+(/[\\w-./?%&=]*)?$";
        let urlTest1 = NSPredicate(format:"SELF MATCHES %@", urlRegex1)
        result1 = (urlTest1.evaluate(with:self))
        let urlRegex2 = "^http://([\\w-]+\\.)+[\\w-]+(/[\\w-./?%&=]*)?$";
        let urlTest2 = NSPredicate(format:"SELF MATCHES %@",
                                   urlRegex2)
        result2 = (urlTest2.evaluate(with:self))
        return result1 || result2
    }
    
    //验证电话号码
    public func isPhoneNumber() ->Bool{
        var result = false
        let phoneRegex = "^((13[0-9])|(17[0-9])|(14[^4,\\D])|(15[^4,\\D])|(18[0-9]))\\d{8}$|^1(7[0-9])\\d{8}$";
        let phoneTest = NSPredicate(format:"SELF MATCHES %@", phoneRegex)
        result = (phoneTest.evaluate(with:self))
        return result;
    }
    
    //验证邮编格式
    public func isZipCodeNumber() ->Bool{
        if self.count==0 {
            return false
        }
        let zipCodeNumber = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let regexCodeNumber = NSPredicate(format:"SELF MATCHES %@",zipCodeNumber)
        if regexCodeNumber.evaluate(with:self) == true{
            return true
        }else{
            return false
        }
    }
    
    // String转float
    public var floatValue:Float{
        return (self as NSString).floatValue
    }
    
    public var doubleValue:Double{
        return (self as NSString).doubleValue
    }
    
    public var intValue:Int{
        return (self as NSString).integerValue
    }
    
    // 过滤掉所有换行、空格和Tab
    public func removeAllSpaceAndNewline() ->String{
        var str = self.replacingOccurrences(of:" ", with:"")
        str = str.replacingOccurrences(of:" ", with:"")
        str = str.replacingOccurrences(of:"\r", with:"")
        str = str.replacingOccurrences(of:"\n", with:"")
        return str
    }
    
    /**     时间戳转时间     */
    public func formartTimeStamp() ->String{
        let string = NSString.init(string:self)
        let timeSta:TimeInterval = string.doubleValue
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let date = Date.init(timeIntervalSince1970: timeSta)
        return timeFormatter.string(from: date)
    }
    
    public func formatTimeWithRex(rex:String) ->String{
        let string = NSString.init(string:self)
        let timeSta:TimeInterval = string.doubleValue
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = rex
        let date = Date.init(timeIntervalSince1970: timeSta)
        return timeFormatter.string(from: date)
    }
    
    /**     将分变成元     保留两位小数     */
    public func yuanMoneyString() ->String{
        let string = NSString.init(string:self)
        var newString = String(string)
        if string.length>2 {
            newString = string.substring(to: string.length-2)  + "." + string.substring(with:NSRange.init(location: string.length-2, length:2))
        }else if string.length==2 {
            newString = "0."+String(string )
        }else if string.length==1 {
            newString = "0.0"+String(string )
        }else{
            newString = "0.00"
        }
        return newString
    }
    
    /**       获得整元 */
    public func MoneyIntegerPart() ->String{
        let string = NSString.init(string:self)
        let fen = string.integerValue
        let newString = String(fen/100)
        return newString
    }
    
    /**     将字典数组变成json 字符串     */
    public func changeDictionsToJsonString(dics:Any) ->String{
        var dataStr = ""
        do{
            let data = try JSONSerialization.data(withJSONObject: dics, options: JSONSerialization.WritingOptions.prettyPrinted)
            dataStr = String(describing:NSString.init(data: data, encoding:String.Encoding.utf8.rawValue)!)
        }catch{
            NSLog("%@", "转换失败")
        }
        return dataStr
    }
    
    /**     将json字符串转dic */
    public func getJsonDic() ->Any? {
        var dic :Any!
        let jsonData = self.data(using:String.Encoding.utf8)
        if nil != jsonData {
            do{
                dic = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.mutableContainers)
                
            }catch{
                NSLog("%@", "解析错误")
            }
        }
        return dic
    }
    
    /**     根据字体和宽度计算文字高度     - parameter width: 约束宽度     - parameter font:  字体大小     - returns: 高度     */
    public func heightWithConstrainedWidth(width:CGFloat, font:UIFont) ->CGFloat{
        let constraintRect = CGSize(width: width, height:CGFloat.greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options:NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context:nil)
        return boundingBox.height
    }
    
    // MARK:- md5
    public var md5: String {
        let str = self.cString(using: String.Encoding.utf8)
        let strLen = CUnsignedInt(self.lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
        CC_MD5(str!, strLen, result)
        let hash = NSMutableString()
        for i in 0 ..< digestLen {
            hash.appendFormat("%02x", result[i])
        }
        result.deinitialize(count:)
        return String(format: hash as String)
    }
    
    // MARK:- json转数组
    public var toArray: [[String: Any]]? {
        
        var json = self
        
        if json.contains("\\") {
            json = json.components(separatedBy: "\\").joined()
        }
        
        if let data = json.data(using: .utf8) {
            do {
                let array = try JSONSerialization.jsonObject(with: data, options: [JSONSerialization.ReadingOptions.init(rawValue: 0)]) as? [[String: Any]]
                
                return array
            } catch {
                NSLog("%@", "解析错误")
            }
        }
        return nil
    }
    
    public enum Validate {
        case email(_: String)       // 邮箱
        case phoneNum(_: String)    // 手机
        case carNum(_: String)      // 车牌号
        case username(_: String)    // 登录名
        case password(_: String)    // 密码
        case nickname(_: String)    // 昵称
        case URL(_: String)         // 网址
        case IP(_: String)          // ip
        case idCard(_: String)      // 身份证号
        case numbers(_: String)     // 只包含数字
        case lettersAndNumbers(_: String) // 只包含字母和数字
        case chinese(_: String)     // 中文
        
        var isRight: Bool {
            var predicateStr:String!
            var currObject:String!
            switch self {
            case let .email(str):
                predicateStr = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
                currObject = str
            case let .phoneNum(str):
                predicateStr = "^1(3[4-9]|4[7]|5[0-27-9]|7[08]|8[2-478])\\d{8}$"
                currObject = str
            case let .carNum(str):
                predicateStr = "^[A-Za-z]{1}[A-Za-z_0-9]{5}$"
                currObject = str
            case let .username(str):
                predicateStr = "^[A-Za-z0-9]{6,20}+$"
                currObject = str
            case let .password(str):
                predicateStr = "^[a-zA-Z0-9]{6,12}+$"
                currObject = str
            case let .nickname(str):
                predicateStr = "^[\\u4e00-\\u9fa5]{4,8}$"
                currObject = str
            case let .URL(str):
                predicateStr = "^(https?:\\/\\/)?([\\da-z\\.-]+)\\.([a-z\\.]{2,6})([\\/\\w \\.-]*)*\\/?$"
                currObject = str
            case let .IP(str):
                predicateStr = "^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$"
                currObject = str
            case let .idCard(str):
                predicateStr = "(^[1-9]\\d{5}(18|19|([23]\\d))\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{3}[0-9Xx]$)|(^[1-9]\\d{5}\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{2}$)"
                currObject = str
            case let .numbers(str):
                predicateStr = "^[0-9]+$"
                currObject = str
            case let .lettersAndNumbers(str):
                predicateStr = "^[a-zA-Z0-9]{1,30}+$"
                currObject = str
            case let .chinese(str):
                predicateStr = "^[\\u4e00-\\u9fa5]{0,100}$"
                currObject = str
            }
            
            let predicate =  NSPredicate(format: "SELF MATCHES %@" ,predicateStr)
            return predicate.evaluate(with: currObject)
        }
    }
    
}
