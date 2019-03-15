//
//  UIView+KZWExtension.swift
//  KZWFoundationSwfit
//
//  Created by yang ou on 2019/3/15.
//

import Foundation
import UIKit

public extension UIView {
    
    /**
     *  设置部分圆角(绝对布局)
     *
     *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
     *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
     */
    public func addRoundedCorners(corners:UIRectCorner , radii:CGSize) {
        let rounded = UIBezierPath.init(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: radii)
        let shape = CAShapeLayer.init()
        shape.path = rounded.cgPath
        self.layer.mask = shape
    }
    
    /**
     *  设置部分圆角(相对布局)
     *
     *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
     *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
     *  @param rect    需要设置的圆角view的rect
     */
    public func addRoundedCorners(corners:UIRectCorner, radii:CGSize, rect:CGRect) {
        let rounded = UIBezierPath.init(roundedRect: rect, byRoundingCorners: corners, cornerRadii: radii)
        let shape = CAShapeLayer.init()
        shape.path = rounded.cgPath
        self.layer.mask = shape
    }
    
}
