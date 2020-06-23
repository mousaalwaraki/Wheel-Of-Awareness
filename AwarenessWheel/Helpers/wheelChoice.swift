//
//  Choice.swift
//  AwarenessWheel
//
//  Created by Mousa Alwaraki on 4/9/20.
//  Copyright © 2020 Mousa Alwaraki. All rights reserved.
//

import Foundation
import AVFoundation

enum wheelChoice {
    case consolidated
    case full
    case basic
    case plane
    case wheel
}

var firstChoice: wheelChoice = .wheel

extension wheelChoice {
    
    func getTitle() -> String {
        switch self {
        case .consolidated:
            return "Consolidated Wheel"
        case .full:
            return "Full Wheel"
        case .basic:
            return "Basic Wheel"
        case .plane:
            return "Plane Wheel"
        case .wheel:
            return "Wheel of Awareness"
        }
    }
    
    func getParagraph() -> String {
        switch self {
        case .consolidated:
            return "This is a practice that should only be done after mastering the basic and full-length practices. This is offered by popular request for those familiar with the Wheel to have a more expedited experience available for their busy lives! \n \nIn this 7 minute wheel of awareness practice, the breath becomes a pacer for the movement of the spoke of attention around the rim. \n \nLet the breath be your focus for the first half-minute of silence at the beginning of this recording. \n \nSome people find it helpful when on the third segment of the rim to count the number of breaths by pressing on the fingers of one hand to reach five for each of the first parts of that segment, and to a count of ten for the 'awareness of awareness' portion as well. \n \nWhen this becomes familiar to you, you can use your own timing to experience this consolidated practice without listening to an external voice."
        case .full:
            return "In this 30 minute full-length wheel of awareness practice, the basic elements are included and in addition two expanded reflective elements are added: \n \n1) Awareness of awareness with the bending of the spoke of attention back towards the hub of knowing; \n\n2) During the fourth segment focus on our sense of connectedness, the research-proven statements of positive intentions and kindness are offered to promote self, other and 'MWe' directed compassion."
        case .basic:
            return "In this 20 minute basic wheel of awareness, you will be guided through the basic experience of the metaphor of the wheel to illuminate the nature of consciousness and its differentiated parts including the hub of knowing, the rim of the known, and the spoke of attention. \n \nThis basic version does not include the hub-on-hub bending of the spoke or the kind intention statements that are a part of the full-length version of the wheel."
        case .plane:
            return "An advanced version of the Wheel of Awareness connecting to and explaining the Plane of Possibility framework. Dan highly recommends this version AFTER completing part 2 of Aware: The Science and Practice of Presence."
        case .wheel:
            return "We are happy to share our Wheel of Awareness with you and hope that you will find it useful. \n \nThe regular practice of the Wheel of Awareness strengthens your mind by integrating your consciousness and empowering you to live a full and vital life. \n \nMindsight is defined as a skill of the mind that promotes insight, empathy and integration. \n\nThis is a mindsight-building practice. \n\nThe Wheel of Awareness is the basis for a reflective practice which helps us direct our attention and improve our ability to focus on the individual aspects of our internal and external worlds, which are key components of a healthy mind. \n\nIf you have any questions, please contact us at info@drdansiegel.com. \n\nWe appreciate having you in our Mindsight community!"
        }
    }
}
