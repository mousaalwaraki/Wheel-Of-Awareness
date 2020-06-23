//
//  Page3ViewController.swift
//  AwarenessWheel
//
//  Created by Mousa Alwaraki on 4/16/20.
//  Copyright © 2020 Mousa Alwaraki. All rights reserved.
//

import UIKit
import AVFoundation

class Page3ViewController: UIViewController {
    
    var playerPageThree:AVAudioPlayer?
    var checkTime:Bool?
    var fullBodyLoops:Int = 30
    var hubInHubLoops:Int = 300
    var allLoops:Int = 1
    var iLoops:Int = 1
    var mWeLoops:Int = 1
    var fullBodyNumber = 0
    var hubInHubNumber = 0
    var allNumber = 1
    var iNumber = 1
    var mWeNumber = 1
    var fileName = ""
    
    @IBOutlet var pageThreeTitle: UILabel!
    @IBOutlet var playButton: UIButton!
    @IBOutlet var seekForward: UIButton!
    @IBOutlet var seekBack: UIButton!
    @IBOutlet var sliderController: UISlider!
    
    @IBOutlet weak var hubInHubLabel: UILabel!
    @IBOutlet weak var statementsLabel: UILabel!
    
    @IBOutlet var wheelIntroSwitch: UISwitch!
    @IBOutlet var rimOneSwitch: UISwitch!
    @IBOutlet var rimTwoSwitch: UISwitch!
    @IBOutlet var simpleMaSwitch: UISwitch!
    @IBOutlet var advancedMaSwitch: UISwitch!
    @IBOutlet weak var hubInHubSwitch: UISwitch!
    
    @IBOutlet weak var hubInHub: UIButton!
    @IBOutlet weak var all: UIButton!
    @IBOutlet weak var i: UIButton!
    @IBOutlet weak var mWe: UIButton!
    
    @IBAction func fullBodyButton(_ sender: Any) {
        thirdChoice = .fullBody
        loopsHidden()
        timeShowing()
        if fullBodyLoops == 30 {
            minsTextField.text = "0"
            minsTextField.textColor = .gray
            secsTextField.text = "30"
            secsTextField.textColor = .gray
        } else {
            minsTextField.textColor = .label
            secsTextField.textColor = .label
        }
    }
    @IBAction func hubInHubButton(_ sender: Any) {
        thirdChoice = .hubInHub
        loopsHidden()
        timeShowing()
        if hubInHubLoops == 300 {
            minsTextField.text = "6"
            minsTextField.textColor = .gray
            secsTextField.text = "00"
            secsTextField.textColor = .gray
        }
    }
    @IBAction func allButton(_ sender: Any) {
        thirdChoice = .all
        timeHidden()
        loopsShowing()
        if allLoops == 1 {
            loopsTextField.text = "1"
            loopsTextField.textColor = .gray
        }
    }
    @IBAction func iButton(_ sender: Any) {
        thirdChoice = .i
        timeHidden()
        loopsShowing()
        if iLoops == 1 {
            loopsTextField.text = "1"
            loopsTextField.textColor = .gray
        }
    }
    @IBAction func mWeButton(_ sender: Any) {
        thirdChoice = .mWe
        timeHidden()
        loopsShowing()
        if mWeLoops == 1 {
            loopsTextField.text = "1"
            loopsTextField.textColor = .gray
        }
    }
    
    @IBAction func minsTextFieldStartedEditing(_ sender: Any) {
        minsTextField.textColor = .label
        secsTextField.textColor = .label
    }
    
    @IBAction func secsTextFieldStartedEditing(_ sender: Any) {
        minsTextField.textColor = .label
        secsTextField.textColor = .label
    }
    
    @IBAction func LoopsTextFieldStartedEditing(_ sender: Any) {
        loopsTextField.textColor = .label
    }
    
    @IBAction func minsTextFieldFinishedEditing(_ sender: Any) {
        if secsTextField.isTouchInside {
            return
        }
        if thirdChoice == .fullBody {
            fullBodyLoops = ((Int(minsTextField.text ?? "0")! * 60) + (Int(secsTextField.text ?? "0")!))
            timeHidden()
        } else if thirdChoice == .hubInHub {
            hubInHubLoops = ((Int(minsTextField.text ?? "0")! * 60) + (Int(secsTextField.text ?? "0")!))
            timeHidden()
        }
    }
    
    @IBAction func secsTextFieldFinishedEditing(_ sender: Any) {
        if minsTextField.isTouchInside {
            return
        }
        if thirdChoice == .fullBody {
            fullBodyLoops = ((Int(minsTextField.text ?? "0")! * 60) + (Int(secsTextField.text ?? "0")!))
            timeHidden()
        } else if thirdChoice == .hubInHub {
            hubInHubLoops = ((Int(minsTextField.text ?? "0")! * 60) + (Int(secsTextField.text ?? "0")!))
            timeHidden()
        }
    }
    
    @IBAction func loopsTextFieldFinishedEditing(_ sender: Any) {
        if thirdChoice == .all {
            allLoops = Int(loopsTextField.text!)!
            loopsHidden()
        } else if thirdChoice == .i {
            iLoops = Int(loopsTextField.text!)!
            loopsHidden()
        } else if thirdChoice == .mWe {
            mWeLoops = Int(loopsTextField.text!)!
            loopsHidden()
        }
    }
    
    
    
    @IBOutlet weak var minsTextField: UITextField!
    @IBOutlet weak var minsLabel: UILabel!
    @IBOutlet weak var secsTextField: UITextField!
    @IBOutlet weak var secsLabel: UILabel!
    @IBOutlet weak var loopsTextField: UITextField!
    @IBOutlet weak var loopsLabel: UILabel!
    
    func loopsHidden() {
        loopsTextField.isHidden = true
        loopsLabel.isHidden = true
    }
    
    func loopsShowing() {
        loopsTextField.isHidden = false
        loopsLabel.isHidden = false
    }
    
    func timeHidden() {
        minsLabel.isHidden = true
        minsTextField.isHidden = true
        secsTextField.isHidden = true
        secsLabel.isHidden = true
    }
    
    func timeShowing() {
        minsLabel.isHidden = false
        minsTextField.isHidden = false
        secsTextField.isHidden = false
        secsLabel.isHidden = false
    }
    
    func playFile(with name: String) {
        
        do {
            let audioFile = Bundle.main.path(forResource: "\(fileName)", ofType: "mp3")
            try playerPageThree = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioFile!) as URL)
            playerPageThree?.prepareToPlay()
            playerPageThree?.play()
            
        } catch {
            print("Couldn't play file")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if firstChoice == .basic {
            hubInHubLabel.isHidden = true
            hubInHubSwitch.isHidden = true
            hubInHub.isHidden = true
            statementsLabel.isHidden = true
            all.isHidden = true
            i.isHidden = true
            mWe.isHidden = true
        }
        pageThreeTitle.text = firstChoice.getTitle()
        // Do any additional setup after loading the view.
        
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    
    @IBAction func playButton(_ sender: Any) {
        
        guard let player = playerPageThree else {
            playButton.setImage(UIImage(systemName: "pause"), for: .normal)
            switch firstChoice {
            case .consolidated:
                fileName = "Consolidated Wheel of Awareness"
                playFile(with: "\(fileName)")
            case .full:
                fileName = "Full Wheel of Awareness"
                playFile(with: "\(fileName)")
            case .basic:
                fileName = "Basic Wheel of Awareness"
                playFile(with: "\(fileName)")
            case .plane:
                fileName = "Full Wheel of Awareness and Plane of Possibilities"
                playFile(with: "\(fileName)")
            case .wheel:
                break
            }
            return
        }
        
        if playerPageThree!.isPlaying {
            player.pause()
            playButton.setImage(UIImage(systemName: "play"), for: .normal)
        } else {
            playerPageThree?.play()
            playButton.setImage(UIImage(systemName: "pause"), for: .normal)
        }
        
    }
    
    @IBAction func goBackButton(_ sender: Any) {
        playerPageThree?.currentTime -= 15
    }
    
    @IBAction func goForwardButton(_ sender: Any) {
        playerPageThree?.currentTime += 15
    }
    
    @IBAction func changeSliderBar(_ sender: Any) {
        guard let player = playerPageThree else {
            return
        }
        playerPageThree!.currentTime = TimeInterval(sliderController.value) * player.duration
        if playerPageThree!.isPlaying {
            player.pause()
            playButton.setImage(UIImage(systemName: "play"), for: .normal)
        } else {
            playerPageThree?.play()
            playButton.setImage(UIImage(systemName: "pause"), for: .normal)
        }
    }
    
    @objc func updateTime() {
        guard let player = playerPageThree else {
            sliderController.setValue(0, animated: false)
            return
        }
        sliderController.setValue(Float(player.currentTime/player.duration), animated: true)
        
        if !wheelIntroSwitch.isOn {
            playerPageThree!.currentTime = 195.1
            playerPageThree?.play()
            wheelIntroSwitch.isOn = true
            wheelIntroSwitch.isHidden = true
        }
        if !rimOneSwitch.isOn && playerPageThree!.currentTime > 194.8 {
            playerPageThree!.currentTime = 226.8
            playerPageThree?.play()
            rimOneSwitch.isOn = true
            rimOneSwitch.isHidden = true
        }
        if !rimTwoSwitch.isOn && playerPageThree!.currentTime > 378 {
            playerPageThree!.currentTime = 396
            rimTwoSwitch.isOn = true
            rimTwoSwitch.isHidden = true
            playerPageThree?.play()
        }
        
        if  playerPageThree!.currentTime > 675 && playerPageThree!.currentTime < 685 {
            playerPageThree!.currentTime = 692
            while fullBodyNumber <= fullBodyLoops {
                if playerPageThree!.currentTime > 691 {
                    playerPageThree!.currentTime = 690
                    fullBodyNumber += 1
                    playerPageThree!.play()
                }
            }
            playerPageThree!.play()
        }
        
        if !simpleMaSwitch.isOn && playerPageThree!.currentTime > 701.5 {
            playerPageThree!.currentTime = 794.25
            simpleMaSwitch.isOn = true
            simpleMaSwitch.isHidden = true
            playerPageThree?.play()
        }
        if !advancedMaSwitch.isOn && playerPageThree!.currentTime > 902.5 {
            playerPageThree!.currentTime = 967.5
            advancedMaSwitch.isOn = true
            advancedMaSwitch.isHidden = true
            playerPageThree?.play()
        }
        if !hubInHubSwitch!.isOn && playerPageThree!.currentTime > 1078 {
            playerPageThree!.currentTime = 1155.7
            hubInHubSwitch.isOn = true
            hubInHubSwitch.isHidden = true
            playerPageThree?.play()
        }
        
        if  playerPageThree!.currentTime > 1171 && playerPageThree!.currentTime < 1175 {
            playerPageThree!.currentTime = 1202
            while hubInHubNumber <= hubInHubLoops {
                if playerPageThree!.currentTime > 1201 {
                    playerPageThree!.currentTime = 1200
                    hubInHubNumber += 1
                    playerPageThree!.play()
                }
            }
            playerPageThree?.currentTime = 1320
            playerPageThree!.play()
        }
        
        if allNumber <= allLoops && playerPageThree!.currentTime > 1574.8 {
            if playerPageThree!.currentTime > 1602 {
                playerPageThree!.currentTime = 1574.8
                playerPageThree!.play()
                allNumber += 1
            }
        }
        
        if iNumber <= iLoops && playerPageThree!.currentTime > 1622 {
            if playerPageThree!.currentTime > 1691 {
                playerPageThree!.currentTime = 1622
                playerPageThree!.play()
                iNumber += 1
            }
        }
        
        if mWeNumber <= mWeLoops && playerPageThree!.currentTime > 1717 {
            if playerPageThree!.currentTime > 1787 {
                playerPageThree!.currentTime = 1717
                playerPageThree!.play()
                mWeNumber += 1
            }
        }
        
        
        //        if !rimFourSwitch.isOn && playerPageThree!.currentTime > 1336.5 {
        //            playerPageThree!.currentTime = 1366.3
        //            rimFourSwitch.isOn = true
        //            playerPageThree?.play()
        //        }
    }
}
