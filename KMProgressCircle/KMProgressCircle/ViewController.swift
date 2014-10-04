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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func progressSliderMoved(sender :AnyObject) {
        var slider = sender as UISlider
        progressCircle.progress = CGFloat(slider.value)
        progressCircle.updateLayerProperties()
    }
}

