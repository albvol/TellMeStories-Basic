//
//  Scene1.swift
//  DiscoveryChallenge
//
//  Created by Alberto Volpe on 01/03/2017.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

import SpriteKit
import GameplayKit

class Scene1: SKScene {
    
    private var background = SKSpriteNode(imageNamed: "Forest")
    private var spinnyNode : SKShapeNode?
    private var papyrus: SKSpriteNode?
    
    override func didMove(to view: SKView) {
        
        background.zPosition = -1
        background.size.width = self.frame.width
        background.size.height = self.frame.height
        if background.size.width < background.size.height {
        }else{
            
        }
        
        //        background.size.width *= 1.7
        //        background.size.height *= 1.7
        background.anchorPoint = CGPoint(x:0,y:0)
        background.position = CGPoint(x: 0, y: 0)
        addChild(background)
        
        //     background.run(SKAction.init(named: "moveSky")!, withKey: "fadeInOut")
        
        self.papyrus = self.childNode(withName: "//papyrus") as? SKSpriteNode
        if let papyrus = self.papyrus {
            papyrus.run(SKAction.init(named: "levitate")!, withKey: "fadeInOut")
        }
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches {
            
            self.touchDown(atPoint: t.location(in: self))
            let location = t.location(in: self)
            let node : SKNode = self.atPoint(location)
            
            switch node.name! {
            case "story1":
                papyrus?.run(SKAction.init(named: "UpScale")!, withKey: "fadeInOut")
                let transition = SKTransition.reveal(with: .left, duration: 2.0)
                
                let nextScene = GameScene(size: scene!.size)
                nextScene.scaleMode = .aspectFill
                
                scene?.view?.presentScene(nextScene, transition: transition)
            case "story2":
                papyrus?.run(SKAction.init(named: "UpScale")!, withKey: "fadeInOut")
            case "story3":
                papyrus?.run(SKAction.init(named: "UpScale")!, withKey: "fadeInOut")
            default:
                break
            }
            
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches {
            
            self.touchUp(atPoint: t.location(in: self))
            let location = t.location(in: self)
            let node : SKNode = self.atPoint(location)
            if node.name == "story1" || node.name == "story2" || node.name == "story3" {
                papyrus?.run(SKAction.init(named: "DownScale")!, withKey: "fadeInOut")
            }
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

