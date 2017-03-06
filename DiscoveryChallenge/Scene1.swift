//
//  Scene1.swift
//  DiscoveryChallenge
//
//  Created by Alberto Volpe on 05/03/2017.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class Scene1: SKScene {
    
    private let sky = BackgroundSprite(usingImage: "Sky", referredWithName: "sky")
    
    override func didMove(to view: SKView) {
        
        self.anchorPoint = CGPoint(x: 0.5, y:0.5)
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches {
            let node = self.atPoint(t.location(in: self))
            
            if node.name != nil {
                switch node.name! {
                default:
                    node.touchesEnded(touches, with: event)
                }
            }
        }
    }
    
    func openScene(nextScene: SKScene) {
        let transition = SKTransition.reveal(with: .left, duration: 2.0)
        nextScene.scaleMode = .aspectFill
        scene?.view?.presentScene(nextScene, transition: transition)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches {
            let node = self.atPoint(t.location(in: self))
            
            if node.name != nil {
                switch node.name! {
                default:
                    node.touchesBegan(touches, with: event)
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches { self.atPoint(t.location(in: self)).touchesMoved(touches, with: event) }
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
}

