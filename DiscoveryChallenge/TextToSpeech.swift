//
//  TextToSpeech.swift
//  story
//
//  Created by Erennio Iannotta on 28/02/2017.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

import AVFoundation

class TextToSpeech {
    
    static func toSpeech(text: String, inLanguage: String, atRate: Float) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: inLanguage)
        utterance.rate = atRate
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)

    }
}
