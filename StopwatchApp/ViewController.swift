//
//  ViewController.swift
//  NavigationBars
//
//  Created by Mustafa Mohamed on 17/12/2015.
//  Copyright (c) 2015 Mustafa Mohamed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var seconds = 0
    var minutes = 0
    var hours = 0
    
    var timer = NSTimer()
    @IBOutlet var timeLabel: UILabel!
   
    @IBAction func startButton(sender: AnyObject) {
    timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("increaseTimer"), userInfo: nil, repeats: true)
    }
   
    @IBAction func reset(sender: AnyObject) {
        timer.invalidate()
        seconds = 0
        minutes = 0
        hours = 0
        timeLabel.text = "0\(hours):0\(minutes):0\(seconds)"
    }
    @IBAction func pauseButton(sender: UIBarButtonItem) {
        timer.invalidate()
    }
    
    func increaseTimer(){
        var hourString:String
        var minuteString:String
        var secondString:String
        
        seconds++
        if seconds >= 60 && minutes < 59{
            seconds = 0
            minutes++
        }
        else if seconds >= 60 && minutes == 59{
            seconds = 0
            minutes = 0
            hours++
        }
        
        if hours<10{
            hourString = "0" + String(hours)
        }
        else{
            hourString = String(hours)
        }
        if minutes<10{
            minuteString = "0" + String(minutes)
        }
        else{
            minuteString = String(minutes)
        }
        if seconds<10{
            secondString = "0" + String(seconds)
        }
        else{
            secondString = String(seconds)
        }
        
        timeLabel.text = "\(hourString):\(minuteString):\(secondString)"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

