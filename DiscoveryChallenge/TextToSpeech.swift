//
//  TextToSpeech.swift
//  story
//
//  Created by Erennio Iannotta on 28/02/2017.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

import AVFoundation

class TextToSpeech {
    
    let synthesizer = AVSpeechSynthesizer()
    
    func toSpeech(text: String, inLanguage: String, atRate: Float) {
        
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: inLanguage)
        utterance.rate = atRate
        
        self.synthesizer.speak(utterance)
        
        
        
        
    }
    
    func pauseSpeaking() {
        self.synthesizer.pauseSpeaking(at: AVSpeechBoundary.word)
    }
    
    func stopSpeaking() {
        synthesizer.stopSpeaking(at: AVSpeechBoundary.immediate)
    }
    
    func continueSpeaking() {
        synthesizer.continueSpeaking()
    }
    
    func isSpeaking() -> Bool {
        return synthesizer.isSpeaking
    }
    
}
