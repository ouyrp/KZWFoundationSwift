//
//  UIButton+KZWExtension.swift
//  KZWFoundationSwfit
//
//  Created by yang ou on 2019/3/15.
//

import Foundation

public extension UIButton {
    public enum KZWImagePosition{
        case KZWImagePositionLeft              //图片在左，文字在右，默认
        case KZWImagePositionRight             //图片在右，文字在左
        case KZWImagePositionTop               //图片在上，文字在下
        case KZWImagePositionBottom            //图片在下，文字在上
    }
    
    
    public func setImagePosition(postion:KZWImagePosition, spacing:CGFloat) {
        guard let titleL = self.titleLabel, let imageV = self.imageView else {
            return
        }
        
        let imageWidth = imageV.frame.size.width
        let imageHeight = imageV.frame.size.height
        
        let labelWidth = titleL.frame.size.width
        let labelHeight = titleL.frame.size.height
        
        let imageX = imageV.frame.origin.x
        let labelX = titleL.frame.origin.x
        
        let margin = labelX - imageX - imageWidth
        
        var imageInsets = UIEdgeInsets.zero
        var labelInsets = UIEdgeInsets.zero
        
        /**
         *  titleEdgeInsets是title相对于其上下左右的inset
         *  如果只有title，那它上下左右都是相对于button的，image也是一样；
         *  如果同时有image和label，那这时候image的上左下是相对于button，右边是相对于label的；title的上右下是相对于button，左边是相对于image的。
         */
        switch postion {
        case .KZWImagePositionTop:
            imageInsets = UIEdgeInsets(top: -0.5 * labelHeight, left: 0.5 * labelWidth + 0.5 * margin + imageX, bottom: 0.5 * (labelHeight + spacing), right: 0.5 * (labelWidth - margin))
            labelInsets = UIEdgeInsets(top: 0.5 * (imageHeight + spacing), left: -(imageWidth - 5), bottom: -0.5 * imageHeight, right: 5)
            
        case .KZWImagePositionBottom:
            imageInsets = UIEdgeInsets(top: 0.5 * (labelHeight + spacing), left: 0.5 * labelWidth + imageX, bottom: -0.5 * labelHeight, right: 0.5 * labelWidth)
            labelInsets = UIEdgeInsets(top: -0.5 * imageHeight, left: -(imageWidth - 5), bottom:0.5 * (imageHeight + spacing), right: 5)
            
        case .KZWImagePositionRight:
            imageInsets = UIEdgeInsets(top: 0, left: 0.5 * (labelWidth + spacing), bottom: 0, right: -(labelWidth + 0.5 * spacing))
            labelInsets = UIEdgeInsets(top: 0, left: -(imageWidth + 0.5 * spacing), bottom: 0, right: imageWidth + spacing * 0.5)
            
        default:
            imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0.5 * spacing)
            labelInsets = UIEdgeInsets(top: 0, left: 0.5 * spacing, bottom: 0, right: 0)
        }
        
        self.titleEdgeInsets = labelInsets;
        self.imageEdgeInsets = imageInsets;
        
    }
}
