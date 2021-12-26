//
//  UIImage+Ext.swift
//  Calculator
//
//  Created by out-nazarov2-ms on 26.12.2021.
//

import UIKit

extension UIImage {
    convenience init(color: UIColor, size: CGSize=CGSize(width: 1, height: 1)) {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(CGRect(origin: CGPoint.zero, size: size))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(cgImage: image!.cgImage!)
    }
}
