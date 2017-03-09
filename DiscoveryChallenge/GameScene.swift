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
    
    private var background = ParralaxSprite(usingImage: "Overlay", referredWithName: "background")
    private var sound, language: Sprite?
    
    override func didMove(to view: SKView) {
        
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
        
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches {
            let node = self.atPoint(t.location(in: self))
            
            if node.name != nil {
                switch node.name! {
                case "sound":
                    var assetName: String
                    if Sound.changeStatus() {
                        assetName = "ActiveSound"
                    }else{
                        assetName = "MuteSound"
                    }
                    sound!.texture = SKTexture(imageNamed: assetName)
                case "language":
                    language!.texture = SKTexture(imageNamed: Language.change())
                case "start":
                    GameViewController.openScene(nextScene: LionScene(size: self.size))
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
