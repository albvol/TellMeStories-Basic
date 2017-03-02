//
//  Scene1.swift
//  DiscoveryChallenge
//
//  Created by Alberto Volpe on 01/03/2017.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class Scene1: SKScene {
    
    private var background = Sprite(usingImage: "Forest", referredWithName: "forest", withAlpha: CGFloat(1.0), onLayer: CGFloat(0))
    private var papyrus: SKSpriteNode?
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y:0.5)
        
        background.position = CGPoint(x:0,y:0)
        background.size = view.bounds.size
        background.moveByAccelerometer()
        
        addChild(background)
        
        let papyrus = Sprite(usingImage: "Papyrus", referredWithName: "papyrus", withAlpha: CGFloat(0.8), onLayer: CGFloat(1))
        papyrus.size.width = size.width/2
        papyrus.size.height = size.height
        papyrus.position = CGPoint(x:size.width/4, y: 0)
        
        addChild(papyrus)
    }
}

