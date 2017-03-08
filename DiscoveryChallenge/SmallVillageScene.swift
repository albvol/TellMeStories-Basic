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

class SmallVillageScene: SKScene {
    
    private var background = ParralaxSprite(usingImage: "SmallVillage", referredWithName: "smallvillage")
    private var sound, language: Sprite?
    override func didMove(to view: SKView) {
        
        
        
        //Add to the Scene the Background
        addChild(background)
        
        
        //Add to the Scene the firstHouse
        let house1 = Sprite(usingImage: "House1", referredWithName: "house1", withAlpha: CGFloat(1.0), onLayer: CGFloat(1))
        house1.position.x = frame.maxX - (house1.size.width/2) - 15
        house1.zPosition = 6
        addChild(house1)
        
        /*
        
        
         //Add to the Scene the Background
         addChild(background)
         
         //Create, Poisition and Add to the Scene the Sound Sprite
         sound = Sprite(usingImage: "ActiveSound", referredWithName: "sound", withAlpha: CGFloat(1.0), onLayer: CGFloat(1))
         sound?.position = CGPoint(x:-(view.frame.width/2) + (((sound?.frame.width)!)/2) ,y: -(view.frame.height/2) + (((sound?.frame.height)!)/2))
         addChild(sound!)
         
         //Create, Poisition and Add to the Scene the Title InteractionableSprite
         let title = InteractionableSprite(usingImage: "Tellmestories", referredWithName: "title", withAlpha: CGFloat(1), onLayer: CGFloat(1))
         title.position = CGPoint(x: 0, y: view.frame.height/2 - title.frame.height)
         addChild(title)
         
         //Create, Poisition and Add to the Scene the Language Label Sprite
         language = Sprite(usingImage: "Italian", referredWithName: "language", withAlpha: CGFloat(1.0), onLayer: CGFloat(1))
         language?.position = CGPoint(x: (view.frame.width/2) - (((language?.frame.width)!)/2) - 16 ,y: -(view.frame.height/2) + (((language?.frame.height)!)/2) + 16)
         addChild(language!)
         
         //Create, Poisition and Add to the Scene the Label "Start"
         let label = SKLabelNode(fontNamed: "Chalkduster")
         label.name = "start"
         label.fontSize = CGFloat(52)
         label.zPosition = 1
         label.fontColor = SKColor.white
         label.text = "Inizia"
         addChild(label)
         */
        showToolbar(withHint: "Un piccolo villaggio...")
    }
    
    func showToolbar(withHint text:String){
        let mapButton = Sprite(usingImage: "MapButton", referredWithName: "backToMap", withAlpha: CGFloat(1.0), onLayer: CGFloat(0))
        mapButton.position.y = frame.maxY - mapButton.size.height/2 + 10
        mapButton.position.x = frame.maxX - mapButton.size.width/2
        mapButton.zPosition = 10
        addChild(mapButton)
        mapButton.run(GameViewController.showToolbar)
        
        let hintBar = Sprite(usingImage: "HintBar", referredWithName: "hintBar", withAlpha: CGFloat(1.0), onLayer: CGFloat(0))
        hintBar.position.y = frame.maxY - mapButton.size.height/2 + 10
        hintBar.zPosition = 10
        hintBar.position.x = frame.maxX - hintBar.size.width/2 - mapButton.size.width
        
        let label = SKLabelNode(fontNamed: "Chalkduster")
        label.fontSize = 23
        label.name = name
        label.text = text
        label.zPosition = 10
        label.fontColor = SKColor.white
        label.position = CGPoint(x: 0, y: -5)
        
        hintBar.addChild(label)
        
        addChild(hintBar)
        hintBar.run(GameViewController.showToolbar)
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
                case "backToMap":
                    openScene(nextScene: MapScene(size: self.size))
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
