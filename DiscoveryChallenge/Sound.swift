//
//  Sound.swift
//  DiscoveryChallenge
//
//  Created by Alberto Volpe on 06/03/2017.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

import Foundation
import AVFoundation

class Sound{
    
    private let TAG = "Sound"
    static private var player: AVAudioPlayer?
    static var playing = false
    
    init(usingFile resourceName: String, withExtension ext: String) {
        
        let url = Bundle.main.url(forResource: resourceName, withExtension: ext)!
        
        do {
            Sound.player = try AVAudioPlayer(contentsOf: url)
            guard let player = Sound.player else { return }
            
            player.prepareToPlay()
            player.volume = 0.1
            Sound.playing = true
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func changeStatus() -> Bool{
        if Sound.playing{
            Sound.player?.pause()
            Sound.playing = !Sound.playing
        }else{
            Sound.player?.play()
            Sound.playing = !Sound.playing
        }
        
        return Sound.playing
    }
    
    static func on(){
        Sound.player?.play()
        Sound.playing = true
    }
    
    static func off(){
        Sound.player?.pause()
        Sound.playing = false
    }
}
