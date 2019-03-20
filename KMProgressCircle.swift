//
//  KMProgressCircle.swift
//  KMProgressCircle
//
//  Created by Kieran McGrady on 04/10/2014.
//  The MIT License
//
//  Copyright Kieran McGrady(c)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of
//  this software and associated documentation files (the "Software"), to deal in
//  the Software without restriction, including without limitation the rights to use,
//  copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the
//  Software, and to permit persons to whom the Software is furnished to do so, subject
//  to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
//  INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//  FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
//  OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
//  OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
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
            foregroundLayer.transform = CATransform3DRotate(foregroundLayer.transform, CGFloat(-Double.pi)/2, 0, 0, 1)
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
