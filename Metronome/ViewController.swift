//
//  ViewController.swift
//  Metronome
//
//  Created by Carlos M. Kampff on 1/18/16.
//  Copyright © 2016 com.starpowermusic. All rights reserved.
//

import UIKit

import AVFoundation

class  ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var audioPlayer : AVAudioPlayer = AVAudioPlayer ()
    
    var timer = NSTimer ()
    
    var time = 0
    
    var soundChoice = ["Block","Kick Drum"]
    
    var placementAnswer = 0
    
    var metronomeSound = NSBundle.mainBundle().pathForResource("HBL2_Ho_ES1_mf", ofType: "wav")!
    
    @IBOutlet var slider: UISlider!
    
  
    @IBOutlet var soundPicker: UIPickerView!
    
    
    @IBAction func sliderInput(sender: AnyObject) {
    
        audioPlayer.volume = slider.value
    
    }
   
    
    @IBAction func soundSet(sender: AnyObject) {
        
        if placementAnswer == 0 {
        
            metronomeSound = NSBundle.mainBundle().pathForResource("HBL2_Ho_ES1_mf", ofType: "wav")!
            
            
        metronomeSound = NSBundle.mainBundle().pathForResource("HBL2_Ho_ES1_mf", ofType: "wav")!
        }
        else  {
            
            metronomeSound = NSBundle.mainBundle().pathForResource("BassDrumMetronome 12:30:16", ofType: "wav")!
        }
        
        
    }
    
    @IBOutlet var signatureInput: UITextField!
    
    @IBOutlet var beatDisplay: UILabel!
    
    
        func result () {
        
            time++
            print(time)
                if time > Int(signatureInput.text!) {
                    time = 1
                }
            if time == 1 {
            // downbeat indicator !!! figure out !!!
            }
            beatDisplay.text = String(time)
            
           
      
            
            
            do   {
                
                try audioPlayer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: metronomeSound))
                
                audioPlayer.play()
                
            }  catch {  print("error 2")
                
            }
        }
    
    
    
    @IBAction func startButton(sender: AnyObject) {
    timer.invalidate()
        timer = NSTimer.scheduledTimerWithTimeInterval(1.4, target: self, selector: Selector("result"), userInfo: nil, repeats: true)
    
    }
    
    
    @IBAction func playAdagio(sender: AnyObject) {
    timer.invalidate()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.9, target: self, selector: Selector("result"), userInfo: nil, repeats: true)
        
    }
    
    @IBAction func playAndante(sender: AnyObject) {
        timer.invalidate()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.7, target: self, selector: Selector("result"), userInfo: nil, repeats: true)
        
    }
    
    
    @IBAction func playModerato(sender: AnyObject) {
        timer.invalidate()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.42, target: self, selector: Selector("result"), userInfo: nil, repeats: true)
        
    }
    
    
    @IBAction func playAlegro(sender: AnyObject) {
        timer.invalidate()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.34, target: self, selector: Selector("result"), userInfo: nil, repeats: true)
        
    }
    
    
    @IBAction func playPresto(sender: AnyObject) {
        timer.invalidate()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: Selector("result"), userInfo: nil, repeats: true)
        
    }
    
    @IBAction func pauseButton(sender: AnyObject) {
    
        timer.invalidate()
        beatDisplay.text = String(1)
        time = 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        soundPicker.delegate = self
        soundPicker.dataSource = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return soundChoice [row]
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return soundChoice.count    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        return 1
        
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        placementAnswer = row
    }
    
}


