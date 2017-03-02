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
        
        let papyrus = Sprite(usingImage: "Papyrus", referredWithName: "papyrus", withAlpha: CGFloat(0.8), onLayer: CGFloat(1), isActive: true)
        
        let title = Sprite(usingImage: "Story", referredWithName: "story", withAlpha: CGFloat(1), onLayer: CGFloat(2), isActive: false)
        title.position = CGPoint(x: 0, y: 125)
        papyrus.addChild(title)
        
        let storyTitle1 = Sprite(usingImage: "StoryTitle1", referredWithName: "story1", withAlpha: CGFloat(1), onLayer: CGFloat(2), isActive: false)
        let storyTitle2 = Sprite(usingImage: "StoryTitle1", referredWithName: "story2", withAlpha: CGFloat(1), onLayer: CGFloat(2), isActive: false)
        let storyTitle3 = Sprite(usingImage: "StoryTitle1", referredWithName: "story3", withAlpha: CGFloat(1), onLayer: CGFloat(2), isActive: false)
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
            print("\(node.name)")
            if node.name != nil {
                switch node.name! {
                case "story1":
                    self.openScene(nextScene: Scene1(size: scene!.size))
                    //                    case "story2":
                    //                        self.openScene(nextScene: Scene1(size: scene!.size))
                    //                    case "story3":
                //                        self.openScene(nextScene: Scene1(size: scene!.size))
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
    
    //    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    //        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    //    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches {
            self.atPoint(t.location(in: self)).touchesBegan(touches, with: event)
           
            let touchedNode = self.atPoint(t.location(in: self))
            if !selectedNode.isEqual(touchedNode) {
                selectedNode.removeAllActions()
                selectedNode = touchedNode as! SKSpriteNode
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches {
            let positionInScene = t.location(in: self)
            let previousPosition = t.previousLocation(in: self)
            let translation = CGPoint(x: positionInScene.x - previousPosition.x, y: positionInScene.y - previousPosition.y)
        
            let position = selectedNode.position
            
            if selectedNode.name! == "papyrus" {
                selectedNode.position = CGPoint(x: position.x + translation.x, y: position.y + translation.y)
            } else {
                let aNewPosition = CGPoint(x: position.x + translation.x, y: position.y + translation.y)
                
                let winSize = self.size
                var retval = aNewPosition
                retval.x = CGFloat(min(retval.x, 0))
                retval.x = CGFloat(max(retval.x, -(background.size.width) + winSize.width))
                retval.y = self.position.y
                
                background.position = retval
            }
        }
    }
}
