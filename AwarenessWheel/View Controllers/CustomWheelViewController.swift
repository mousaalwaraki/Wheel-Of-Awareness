//
//  Page3ViewController.swift
//  AwarenessWheel
//
//  Created by Mousa Alwaraki on 4/16/20.
//  Copyright © 2020 Mousa Alwaraki. All rights reserved.
//

import UIKit
import AVFoundation

class CustomWheelViewController: UIViewController, AVAudioPlayerDelegate {
    
    var playerPageThree:AVAudioPlayer?
    var checkTime:Bool?
    var fullBodyLoops:Int = 30
    var hubInHubLoops:Int = 300
    var statementsLoop:Int = 1
    
    let wheelIntro = URL(fileURLWithPath: Bundle.main.path(forResource: "Wheel Intro", ofType: "mp3")!)
    let rimOneIntro = URL(fileURLWithPath: Bundle.main.path(forResource: "Rim 1 Intro", ofType: "mp3")!)
    let rimOne = URL(fileURLWithPath: Bundle.main.path(forResource: "Rim 1", ofType: "mp3")!)
    let rimTwoIntro = URL(fileURLWithPath: Bundle.main.path(forResource: "Rim 2 Intro", ofType: "mp3")!)
    let rimTwo = URL(fileURLWithPath: Bundle.main.path(forResource: "Rim 2", ofType: "mp3")!)
    let rimThreePartOneIntro = URL(fileURLWithPath: Bundle.main.path(forResource: "Rim 3 part 1 Intro", ofType: "mp3")!)
    let rimThreePartOne = URL(fileURLWithPath: Bundle.main.path(forResource: "Rim 3 part 1", ofType: "mp3")!)
    let rimThreePartTwoIntro = URL(fileURLWithPath: Bundle.main.path(forResource: "Rim 3 part 2 Intro", ofType: "mp3")!)
    let rimThreePartTwo = URL(fileURLWithPath: Bundle.main.path(forResource: "Rim 3 part 2", ofType: "mp3")!)
    let hubInHubIntro = URL(fileURLWithPath: Bundle.main.path(forResource: "Hub In Hub Intro", ofType: "mp3")!)
    let hubInHubSection = URL(fileURLWithPath: Bundle.main.path(forResource: "Hub In Hub", ofType: "mp3")!)
    let rimFour = URL(fileURLWithPath: Bundle.main.path(forResource: "Rim 4", ofType: "mp3")!)
    let finalSection = URL(fileURLWithPath: Bundle.main.path(forResource: "Final Section", ofType: "mp3")!)
    let outro = URL(fileURLWithPath: Bundle.main.path(forResource: "Outro", ofType: "mp3")!)
    let silence = URL(fileURLWithPath: Bundle.main.path(forResource: "Silence", ofType: "mp3")!)
    
    
    @IBOutlet var pageThreeTitle: UILabel!
    @IBOutlet var playButton: UIButton!
    @IBOutlet weak var hubInHubLabel: UILabel!
    @IBOutlet var wheelIntroSwitch: UISwitch!
    @IBOutlet var rimOneSwitch: UISwitch!
    @IBOutlet var rimTwoSwitch: UISwitch!
    @IBOutlet var simpleMaSwitch: UISwitch!
    @IBOutlet var advancedMaSwitch: UISwitch!
    @IBOutlet weak var hubInHubSwitch: UISwitch!
    @IBOutlet weak var hubInHub: UIButton!
    @IBOutlet weak var minsTextField: UITextField!
    @IBOutlet weak var secsTextField: UITextField!
    @IBOutlet weak var loopsTextField: UITextField!
    
    
    @IBAction func fullBodyButton(_ sender: Any) {
        thirdChoice = .fullBody
        loopsHidden()
        timeShowing()
        
        minsTextField.text = "\(UserDefaults.standard.value(forKey: "fullBodyMins") ?? "smth")"
        secsTextField.text = "\(UserDefaults.standard.value(forKey: "fullBodySecs") ?? "smth")"
        
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
        
        minsTextField.text = "\(UserDefaults.standard.value(forKey: "hubMins") ?? "smth")"
        secsTextField.text = "\(UserDefaults.standard.value(forKey: "hubSecs") ?? "smth")"
        
        if hubInHubLoops == 300 {
            minsTextField.text = "6"
            minsTextField.textColor = .gray
            secsTextField.text = "00"
            secsTextField.textColor = .gray
        } else {
            minsTextField.textColor = .label
            secsTextField.textColor = .label
        }
    }
    
    @IBAction func statementsButtonTapped(_ sender: Any) {
        loopsShowing()
        timeHidden()
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
    
    @IBAction func minsTextFieldEdited(_ sender: Any) {
//        if secsTextField.isTouchInside {
//            return
//        }
        
        if minsTextField.text == "" {
            return
        }
        
        if thirdChoice == .fullBody {
            fullBodyLoops = ((Int(minsTextField.text ?? "0")! * 60) + (Int(secsTextField.text ?? "0")!))
            UserDefaults.standard.set("\(minsTextField.text ?? "smth")", forKey: "fullBodyMins")
        } else if thirdChoice == .hubInHub {
            hubInHubLoops = ((Int(minsTextField.text ?? "0")! * 60) + (Int(secsTextField.text ?? "0")!))
            UserDefaults.standard.set("\(minsTextField.text ?? "smth")", forKey: "hubMins")
        }
    }
    @IBAction func secsTextFieldEditing(_ sender: Any) {
//        if minsTextField.isTouchInside {
//            return
//        }
        
        if secsTextField.text == "" {
            return
        }
        
        if thirdChoice == .fullBody {
            fullBodyLoops = ((Int(minsTextField.text ?? "0")! * 60) + (Int(secsTextField.text ?? "0")!))
            UserDefaults.standard.set("\(secsTextField.text ?? "smth")", forKey: "fullBodySecs")
        } else if thirdChoice == .hubInHub {
            hubInHubLoops = ((Int(minsTextField.text ?? "0")! * 60) + (Int(secsTextField.text ?? "0")!))
            UserDefaults.standard.set("\(secsTextField.text ?? "smth")", forKey: "hubSecs")
        }
    }
    @IBAction func loopsTextFieldEditing(_ sender: Any) {
        statementsLoop = Int(loopsTextField.text!)!
        loopsHidden()
    }
    
    
    @IBOutlet weak var minsLabel: UILabel!
    @IBOutlet weak var secsLabel: UILabel!
    @IBOutlet weak var loopsLabel: UILabel!
    
    var counter = 0
    var audioNumber = 0
    
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
    
    func playAudioFile(_ index: Int) {
        
        let soundFiles = NSMutableArray(array: [])
        
        if wheelIntroSwitch.isOn {
            soundFiles.add(wheelIntro)
        }
        if rimOneSwitch.isOn {
            soundFiles.add(rimOneIntro)
        }
        soundFiles.add(rimOne)
        if rimTwoSwitch.isOn {
            soundFiles.add(rimTwoIntro)
        }
        soundFiles.add(rimTwo)
        for _ in 1...Int(fullBodyLoops) {
            soundFiles.add(silence)
        }
        if simpleMaSwitch.isOn {
            soundFiles.add(rimThreePartOneIntro)
        }
        soundFiles.add(rimThreePartOne)
        if advancedMaSwitch.isOn {
            soundFiles.add(rimThreePartTwoIntro)
        }
        soundFiles.add(rimThreePartTwo)
        if hubInHubSwitch.isOn {
            soundFiles.add(hubInHubIntro)
        }
        soundFiles.add(hubInHubSection)
        for _ in 1...Int(hubInHubLoops) {
            soundFiles.add(silence)
        }
        soundFiles.add(rimFour)
        for _ in 0...statementsLoop {
            soundFiles.add(finalSection)
        }
        soundFiles.add(outro)
        
        wheelIntroSwitch.isEnabled = false
        rimOneSwitch.isEnabled = false
        rimTwoSwitch.isEnabled = false
        simpleMaSwitch.isEnabled = false
        advancedMaSwitch.isEnabled = false
        hubInHubSwitch.isEnabled = false
        
        audioNumber = soundFiles.count
        
        do
        {
            playerPageThree = try AVAudioPlayer(contentsOf: soundFiles[index] as! URL)
            playerPageThree!.delegate = self
            playerPageThree?.play()
            counter += 1
        }
        catch{print("error")}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerPageThree?.delegate = self
        
        pageThreeTitle.text = firstChoice.getTitle()
    }
    
    
    @IBAction func playButton(_ sender: Any) {
        
        loopsHidden()
        timeHidden()
        
        guard let player = playerPageThree else {
            playButton.setImage(UIImage(systemName: "pause"), for: .normal)
            playAudioFile(counter)
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
        
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if counter < audioNumber - 1 || counter == audioNumber - 1 {
            playAudioFile(counter)
        } else {
            playerPageThree?.stop()
            playButton.setImage(UIImage(systemName: "play"), for: .normal)
        }
    }
}
