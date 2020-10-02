//
//  FullWheelsViewController.swift
//  AwarenessWheel
//
//  Created by Mousa Alwaraki on 4/8/20.
//  Copyright © 2020 Mousa Alwaraki. All rights reserved.
//

import UIKit
import AVFoundation

class FullWheelsViewController: UIViewController, AVAudioPlayerDelegate{
    
    var player:AVAudioPlayer?
    var fileName = ""
    
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    
    @IBOutlet var sliderBar: UISlider!
    @IBOutlet var pausePlayButton: UIButton!
    @IBOutlet weak var consolidatedButton: UIButton!
    @IBOutlet weak var fullButton: UIButton!
    @IBOutlet weak var basicButton: UIButton!
    @IBOutlet weak var planeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        basicButton.layer.borderColor = UIColor.red.cgColor
        consolidatedButton.layer.borderColor = UIColor.green.cgColor
        fullButton.layer.borderColor = UIColor.blue.cgColor
        planeButton.layer.borderColor = UIColor.orange.cgColor
        
        makeCircular(buttons: [basicButton, consolidatedButton, fullButton, planeButton])
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        buttonOne.layer.cornerRadius = 12
        buttonTwo.layer.cornerRadius = 12
        buttonOne.backgroundColor = .systemBlue
        buttonTwo.backgroundColor = .systemBlue
    }
    
    @IBAction func changeSliderBar(_ sender: Any) {
        guard let player = player else {
            return
        }
        player.currentTime = TimeInterval(sliderBar.value) * player.duration
        pausePlayButton.setImage(UIImage(systemName: "play"), for: .normal)
    }
    
    @IBAction func buttonTwoTapped(_ sender: Any) {
        if firstChoice == .wheel {
            let wheeldetailsVC = self.storyboard?.instantiateViewController(identifier: "wheelDetailsViewController")
            wheeldetailsVC!.modalPresentationStyle = .popover
            self.present(wheeldetailsVC!, animated: true)
            
        } else {
            let customVC = self.storyboard?.instantiateViewController(identifier: "customViewController")
            customVC!.modalPresentationStyle = .popover
            self.present(customVC!, animated: true)
        }
    }
    
    @IBAction func wheelButton(_ sender: Any) {
        tapFunctions( .wheel, "What is the Wheel of Awareness", "Why is this practice important?")
        player = nil
        buttonTwo.isHidden = false
    }
    
    @IBAction func consolidatedButton(_ sender: Any) {
        tapFunctions( .consolidated, "Consolidated Wheel Details", "")
        player = nil
        buttonTwo.isHidden = true
    }
    
    @IBAction func fullButton(_ sender: Any) {
        tapFunctions( .full, "Full Wheel Details", "Custom Full Wheel")
        player = nil
        buttonTwo.isHidden = false
    }
    
    @IBAction func basicButton(_ sender: Any) {
        tapFunctions( .basic, "Basic Wheel Details", "")
        player = nil
        buttonTwo.isHidden = true
    }
    
    @IBAction func planeButton(_ sender: Any) {
        tapFunctions( .plane, "Plane Wheel Details", "")
        player = nil
        buttonTwo.isHidden = true
    }
    
    // Audio Player
    @IBAction func goBackButton(_ sender: Any) {
        player?.currentTime -= 15
    }
    
    @IBAction func playPauseButton(_ sender: Any) {
        
        guard let player = player else {
            pausePlayButton.setImage(UIImage(systemName: "pause"), for: .normal)
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
        
        if player.isPlaying {
            player.pause()
            pausePlayButton.setImage(UIImage(systemName: "play"), for: .normal)
        } else {
            player.play()
            pausePlayButton.setImage(UIImage(systemName: "pause"), for: .normal)
        }
        
    }
    
    @IBAction func goForwardButton(_ sender: Any) {
        player?.currentTime += 15
    }

    @objc func updateTime() {
        guard let player = player else {
            sliderBar.setValue(0, animated: false)
            return
        }
        sliderBar.setValue(Float(player.currentTime/player.duration), animated: true)
    }
    
    func playFile(with name: String) {
        do {
            let audioFile = Bundle.main.path(forResource: "\(fileName)", ofType: "mp3")
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioFile!) as URL)
            player?.prepareToPlay()
            player?.play()
            
        } catch {
            print("Couldn't play file")
        }
    }
    
    func makeCircular(buttons: [UIButton]) {
        for button in buttons {
            button.layer.cornerRadius = button.frame.width/2
            button.layer.borderWidth = 1
        }
    }
    
    func tapFunctions(_ Choices: wheelChoice,_ title: String, _ titleTwo: String) {
        firstChoice = Choices
        buttonOne.setTitle(title, for: .normal)
        buttonTwo.setTitle(titleTwo, for: .normal)
    }
}




