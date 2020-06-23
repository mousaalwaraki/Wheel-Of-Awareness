//
//  SoundManager.swift
//  AwarenessWheel
//
//  Created by Mousa Alwaraki on 4/8/20.
//  Copyright © 2020 Mousa Alwaraki. All rights reserved.
//

import Foundation
import AVFoundation

class SoundManager {

static var audioPlayer:AVAudioPlayer?

enum AVAudioPlayer {
    
    case Basic
    case Consolidated
    case Full
    case Plane
    
}

    static func PlaySound(_ effect:AVAudioPlayer) {
    
    var soundFilename = ""
    
    // Setermine which sound effect we want to play
    // And set the appropriate filename
    switch effect {
        
        case .Basic:
            soundFilename = "Basic Wheel of Awareness"
        
        case .Consolidated:
            soundFilename = "Consolidated Wheel of Awareness"
        
        case .Full:
            soundFilename = "Full Wheel of Awareness and Plane of Possibilities"
        
        case .Plane:
            soundFilename = "Full Wheel of Awareness"
        
    }
}
}
