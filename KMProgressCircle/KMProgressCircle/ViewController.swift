//
//  ViewController.swift
//  KMProgressCircle
//
//  Created by Kieran McGrady on 04/10/2014.
//  Copyright (c) 2014 HotRod Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var progressCircle :KMProgressCircle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // We can  set the background and foreground colors
        progressCircle.bgColor = UIColor.blackColor();
        progressCircle.fgColor = UIColor.redColor();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func progressSliderMoved(sender :AnyObject) {
        // Cast sender to UISlider so we can access its properties
        var slider = sender as UISlider
        // Set the progressCircle's progress to the sliders value
        progressCircle.progress = CGFloat(slider.value)
        // Finally we make a call to update the stroke
        progressCircle.updateLayerProperties()
    }
}

