//
//  Page2ViewController.swift
//  AwarenessWheel
//
//  Created by Mousa Alwaraki on 4/8/20.
//  Copyright © 2020 Mousa Alwaraki. All rights reserved.
//

import UIKit

class Page2ViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var paragraphText: UILabel!
    @IBOutlet var firstFiveSenses: UIButton!
    @IBOutlet var innerSensations: UIButton!
    @IBOutlet var mentalActivities: UIButton!
    @IBOutlet var hubInHub: UIButton!
    @IBOutlet var relationSense: UIButton!
    @IBOutlet var kindIntentions: UIButton!
    
    @IBOutlet var imageWheel: UIImageView!
    @IBOutlet var planeOne: UIImageView!
    @IBOutlet var planeTwo: UIImageView!
    @IBOutlet var planeThree: UIImageView!
    @IBOutlet var planeFour: UIImageView!
    @IBOutlet var planeFive: UIImageView!
    @IBOutlet var planeSix: UIImageView!
    
    @IBAction func firstFiveSensesButton(_ sender: Any) {
        openNextScreen(with: .firstFiveSensations)
        
    }
    @IBAction func innerSensationsButton(_ sender: Any) {
        openNextScreen(with: .innerSensations)
    }
    @IBAction func mentalActivitiesButton(_ sender: Any) {
        if firstChoice == .basic {
            openNextScreen(with: .firstFiveSensations)
        } else {
            openNextScreen(with: .mentalActivities)
        }
        
    }
    @IBAction func hubInHubButton(_ sender: Any) {
        if firstChoice == .basic {
            openNextScreen(with: .innerSensations)
        } else {
            openNextScreen(with: .hubInHub)
        }
        
    }
    @IBAction func relationalSenseButton(_ sender: Any) {
        if firstChoice == .basic {
            openNextScreen(with: .mentalActivities)
        } else {
            openNextScreen(with: .relationalSense)
        }
        
    }
    @IBAction func kindIntentionsButton(_ sender: Any) {
        if firstChoice == .basic {
            openNextScreen(with: .relationalSense)
        } else {
        openNextScreen(with: .kindIntentions)
        }
    }
    
    func openNextScreen(with choice: explainedChoices) {
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "Page4ViewController") as? Page4ViewController else {
            return
        }
        vc.choice = choice
        present(vc, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        kindIntentions.layer.cornerRadius = 12
        relationSense.layer.cornerRadius = 12
        hubInHub.layer.cornerRadius = 12
        mentalActivities.layer.cornerRadius = 12
        firstFiveSenses.layer.cornerRadius = 12
        innerSensations.layer.cornerRadius = 12
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pictures = [imageWheel, planeOne, planeTwo, planeThree, planeFour, planeFive, planeSix]
        for picture in pictures {
            picture?.isHidden = true
        }
        
        let planePics = [planeOne, planeTwo, planeThree, planeFour, planeFive, planeSix]
        
        titleLabel.text = firstChoice.getTitle()
        paragraphText.text = firstChoice.getParagraph()
        
        if firstChoice == .basic {
            
            kindIntentions.setTitle("4. Relational Sense", for: .normal)
            relationSense.setTitle("3. Mental Activities", for: .normal)
            hubInHub.setTitle("2. Inner Sensations", for: .normal)
            mentalActivities.setTitle("1. First Five Senses", for: .normal)

            firstFiveSenses.isHidden = true
            innerSensations.isHidden = true
            
            kindIntentions.layer.cornerRadius = 12
            relationSense.layer.cornerRadius = 12
            hubInHub.layer.cornerRadius = 12
            mentalActivities.layer.cornerRadius = 12
            
        } else
            if firstChoice == .plane {
            
            for plane in planePics {
                plane?.isHidden = false
            }
            let buttons = [firstFiveSenses, innerSensations, mentalActivities, hubInHub, relationSense, kindIntentions]
            for button in buttons {
                button?.isHidden = true
            }
            
        } else if firstChoice == .wheel {
            
                imageWheel.isHidden = false
            
            let buttons = [firstFiveSenses, innerSensations, mentalActivities, hubInHub, relationSense, kindIntentions]
            for button in buttons {
                button?.isHidden = true
            }
        }
    }
}
