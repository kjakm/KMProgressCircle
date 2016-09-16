//
//  KMProgressCircle.swift
//  KMProgressCircle
//
//  Created by Kieran McGrady on 04/10/2014.
//  Copyright (c) 2014 HotRod Software. All rights reserved.
//

import UIKit
import QuartzCore

@IBDesignable
class KMProgressCircle: UIView {

    var backgroundLayer: CAShapeLayer!
    var foregroundLayer: CAShapeLayer!
    
    var lineWidth: CGFloat = 10.0
    
    @IBInspectable var progress :CGFloat = 0.6
    @IBInspectable var bgColor :UIColor = UIColor.gray
    @IBInspectable var fgColor :UIColor = UIColor.blue
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Create the background layer
        if !(backgroundLayer != nil) {
            backgroundLayer = CAShapeLayer()
            layer.addSublayer(backgroundLayer)
         
            let rect = bounds.insetBy(dx: lineWidth / 2.0, dy: lineWidth / 2.0)
            let path = UIBezierPath(ovalIn: rect)
            
            backgroundLayer.path = path.cgPath
            backgroundLayer.fillColor = nil
            backgroundLayer.lineWidth = lineWidth
            backgroundLayer.strokeColor = bgColor.cgColor
        }
        
        backgroundLayer.frame = layer.bounds
        
        // Create the foreground layer. This is the layer that displays the progress.
        if !(foregroundLayer != nil) {
            foregroundLayer = CAShapeLayer()
            layer.addSublayer(foregroundLayer)
            
            let rect = bounds.insetBy(dx: lineWidth / 2.0, dy: lineWidth / 2.0)
            let path = UIBezierPath(ovalIn: rect)
            
            foregroundLayer.path = path.cgPath
            foregroundLayer.fillColor = nil
            foregroundLayer.lineWidth = lineWidth
            foregroundLayer.strokeColor = fgColor.cgColor
            foregroundLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            foregroundLayer.transform = CATransform3DRotate(foregroundLayer.transform, CGFloat(-M_PI)/2, 0, 0, 1)
        }
        
        foregroundLayer.frame = layer.bounds
        
        // Update the stroke
        updateLayerProperties()
    }
   
    // Update the stroke of the foreground layer to match the progress value
    func updateLayerProperties() {
        if (foregroundLayer != nil) {
            foregroundLayer.strokeEnd = progress
        }
    }
}
