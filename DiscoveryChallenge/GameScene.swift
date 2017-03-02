//
//  GameScene.swift
//  test
//
//  Created by Alberto Volpe on 28/02/2017.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var background = SKSpriteNode(imageNamed: "Background")
    private var spinnyNode : SKShapeNode?
    var selectedNode = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        
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
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches {
            let node = self.atPoint(t.location(in: self))
            node.touchesEnded(touches, with: event)
            
            if node.name != nil {
                switch node.name! {
                case "story1":
                    self.openScene(nextScene: Scene1(size: scene!.size))
                case "story2":
                    self.openScene(nextScene: Scene1(size: scene!.size))
                case "story3":
                    self.openScene(nextScene: Scene1(size: scene!.size))
                default:
                    break
                }
            }
        }
    }
    
    func openScene(nextScene: SKScene) {
        let transition = SKTransition.reveal(with: .left, duration: 2.0)
        let nextScene = Scene1(size: scene!.size)
        nextScene.scaleMode = .aspectFill
        scene?.view?.presentScene(nextScene, transition: transition)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches { self.atPoint(t.location(in: self)).touchesBegan(touches, with: event) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches { self.atPoint(t.location(in: self)).touchesMoved(touches, with: event) }
    }
}
