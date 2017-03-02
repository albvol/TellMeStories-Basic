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
    
    private var background = SKSpriteNode(imageNamed: "Forest")
    private var papyrus: SKSpriteNode?
    
    override func didMove(to view: SKView) {
        
        background.anchorPoint = CGPoint(x:0,y:0)
        background.position = CGPoint(x:0,y:0)
        background.zPosition = -1
        background.size = view.bounds.size
        
        addChild(background)
        
        let papyrus = Sprite(usingImage: "Papyrus", referredWithName: "papyrus", withAlpha: CGFloat(0.8), onLayer: CGFloat(1), isActive: true, isDraggable: true)
        
        let title = Sprite(usingImage: "Story", referredWithName: "story", withAlpha: CGFloat(1), onLayer: CGFloat(2), isActive: false, isDraggable: false)
        title.position = CGPoint(x: 0, y: 125)
        papyrus.addChild(title)
        
        let storyTitle1 = Sprite(usingImage: "StoryTitle1", referredWithName: "story1", withAlpha: CGFloat(1), onLayer: CGFloat(2), isActive: false, isDraggable: false)
        let storyTitle2 = Sprite(usingImage: "StoryTitle1", referredWithName: "story2", withAlpha: CGFloat(1), onLayer: CGFloat(2), isActive: false, isDraggable: false)
        let storyTitle3 = Sprite(usingImage: "StoryTitle1", referredWithName: "story3", withAlpha: CGFloat(1), onLayer: CGFloat(2), isActive: false, isDraggable: false)
        storyTitle1.position = CGPoint(x: 0, y: title.position.y - 105)
        storyTitle2.position = CGPoint(x: 0, y: storyTitle1.position.y - 65)
        storyTitle3.position = CGPoint(x: 0, y: storyTitle2.position.y - 65)
  
        papyrus.addChild(storyTitle1)
        papyrus.addChild(storyTitle2)
        papyrus.addChild(storyTitle3)
        addChild(papyrus)
    }
}

