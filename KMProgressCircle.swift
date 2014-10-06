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
    @IBInspectable var bgColor :UIColor = UIColor.grayColor()
    @IBInspectable var fgColor :UIColor = UIColor.blueColor()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Create the background layer
        if !(backgroundLayer != nil) {
            backgroundLayer = CAShapeLayer()
            layer.addSublayer(backgroundLayer)
         
            let rect = CGRectInset(bounds, lineWidth / 2.0, lineWidth / 2.0)
            let path = UIBezierPath(ovalInRect: rect)
            
            backgroundLayer.path = path.CGPath
            backgroundLayer.fillColor = nil
            backgroundLayer.lineWidth = lineWidth
            backgroundLayer.strokeColor = bgColor.CGColor
        }
        
        backgroundLayer.frame = layer.bounds
        
        // Create the foreground layer. This is the layer that displays the progress.
        if !(foregroundLayer != nil) {
            foregroundLayer = CAShapeLayer()
            layer.addSublayer(foregroundLayer)
            
            let rect = CGRectInset(bounds, lineWidth / 2.0, lineWidth / 2.0)
            let path = UIBezierPath(ovalInRect: rect)
            
            foregroundLayer.path = path.CGPath
            foregroundLayer.fillColor = nil
            foregroundLayer.lineWidth = lineWidth
            foregroundLayer.strokeColor = fgColor.CGColor
            foregroundLayer.anchorPoint = CGPointMake(0.5, 0.5)
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
