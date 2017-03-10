//
//  AnimalSound.swift
//  DiscoveryChallenge
//
//  Created by Alberto Volpe on 10/03/2017.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

import Foundation
import AVFoundation

class AnimalSound{
    
    private let TAG = "AnimalSound"
    static private var player: AVAudioPlayer?
    static var playing = false
    
    init(usingFile resourceName: String, withExtension ext: String) {
        
        let url = Bundle.main.url(forResource: resourceName, withExtension: ext)!
        
        do {
            AnimalSound.player = try AVAudioPlayer(contentsOf: url)
            guard let player = AnimalSound.player else { return }
            
            player.prepareToPlay()
            player.volume = 0.6
            AnimalSound.playing = true
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func changeStatus() -> Bool{
        if AnimalSound.playing{
            AnimalSound.player?.pause()
            AnimalSound.playing = !Sound.playing
        }else{
            AnimalSound.player?.play()
            AnimalSound.playing = !Sound.playing
        }
        
        return AnimalSound.playing
    }
    
    static func on(){
        AnimalSound.player?.play()
        AnimalSound.playing = true
    }
    
    static func off(){
        AnimalSound.player?.pause()
        AnimalSound.playing = false
    }
}

