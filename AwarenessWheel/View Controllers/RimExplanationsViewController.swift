//
//  Page4ViewController.swift
//  AwarenessWheel
//
//  Created by Mousa Alwaraki on 4/9/20.
//  Copyright © 2020 Mousa Alwaraki. All rights reserved.
//

import UIKit

class RimExplanationsViewController: UIViewController {
    
    @IBOutlet var p4TitleLabel: UILabel!
    @IBOutlet var p4ParagraphLabel: UILabel!
    
    var choice: explainedChoices!
    
    @IBOutlet var imageOne: UIImageView!
    @IBOutlet var imageTwo: UIImageView!
    @IBOutlet var imageThree: UIImageView!
    
    @IBOutlet var labelOne: UILabel!
    @IBOutlet var labelTwo: UILabel!
    @IBOutlet var labelThree: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let images = [imageOne, imageTwo, imageThree, labelOne, labelTwo, labelThree]
        for image in images {
            image?.isHidden = true
        }
        self.p4ParagraphLabel.numberOfLines = 0
        if choice == .firstFiveSensations {
            
            p4TitleLabel.text = firstFiveSenseTitle()
            p4ParagraphLabel.text = firstFiveSensesParagraph()
            
        } else if choice == .innerSensations {
            
            p4TitleLabel.text = innerSensesTitle()
            p4ParagraphLabel.text = innerSensesParagraph()
            
        } else if choice == .mentalActivities {
            
            p4TitleLabel.text = mentalActivitiesTitle()
            p4ParagraphLabel.text = mentalActivitiesParagraph()
            
        } else if choice == .hubInHub {
            
            for image in images {
                image?.isHidden = false
            }
            p4TitleLabel.text = hubInHubTitle()
            p4ParagraphLabel.text = hubInHubParagraph()
            
        } else if choice == .relationalSense {
            
            p4TitleLabel.text = relationalSenseTitle()
            p4ParagraphLabel.text = relationalSenseParagraph()
            
        } else if choice == .kindIntentions {
            
            p4TitleLabel.text = kindIntentionsTitle()
            p4ParagraphLabel.text = kindIntentionsParagraph()
            
        }
    }
}
