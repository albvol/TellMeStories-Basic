//
//  MainMapScene.swift
//  DiscoveryChallenge
//
//  Created by Erennio Iannotta on 08/03/2017.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class MainMapScene: MapScene {
    
    private let TAG = "MainMapScene"
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(TAG, "touchesEnded")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(TAG, "touchesMoved")
    }
    
    override func update(_ currentTime: TimeInterval) {
        //do nothing
    }
}
