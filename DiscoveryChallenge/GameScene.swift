//
//  GameScene.swift
//  test
//
//  Created by Alberto Volpe on 28/02/2017.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion

class GameScene: SKScene {
    
    private var background = BackgroundSprite(usingImage: "Background", referredWithName: "background")
    
    override func didMove(to view: SKView) {
        
        let aspectRatio1 = view.frame.width/view.frame.height
        let randWidth1 = CGFloat(view.frame.width + 50.0)
        background.size = CGSize(width: randWidth1, height: randWidth1/aspectRatio1)
        addChild(background)
        
        let papyrus = InteractionableSprite(usingImage: "Papyrus", referredWithName: "papyrus", withAlpha: CGFloat(0.8), onLayer: CGFloat(1))
        
        let title = Sprite(usingImage: "Story", referredWithName: "story", withAlpha: CGFloat(1), onLayer: CGFloat(2))
        title.position = CGPoint(x: 0, y: 125)
        papyrus.addChild(title)
        
        let storyTitle1 = Sprite(usingImage: "StoryTitle1", referredWithName: "story1", withAlpha: CGFloat(1), onLayer: CGFloat(2))
        storyTitle1.position = CGPoint(x: 0, y: title.position.y - 105)
 
        papyrus.addChild(storyTitle1)
        
        addChild(papyrus)
    
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
        let transition = SKTransition.doorway(withDuration: 1.0)
        nextScene.scaleMode = .aspectFill
        scene?.view?.presentScene(nextScene, transition: transition)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches {
            let node = self.atPoint(t.location(in: self))
            
            if node.name != nil {
                switch node.name! {
                case "story1":
                    self.openScene(nextScene: MapScene(size: scene!.size))
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
        self.background.parallaxMove()
    }
}
