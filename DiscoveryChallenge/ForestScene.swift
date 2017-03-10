//
//  ErcoleAtMicene.swift
//  DiscoveryChallenge
//
//  Created by Riccardo Barba on 08/03/17.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion

class ForestScene: SKScene {
    
    private let tts = TextToSpeech()
    private let foresta = ParralaxSprite(usingImage: "Foresta2", referredWithName: "forest2")
    
    override func didMove(to view: SKView) {
    
         self.anchorPoint = CGPoint(x: 0.5, y:0.5)
        
        let aspectRatio1 = view.frame.width/view.frame.height
        let randWidth1 = CGFloat(view.frame.width + 50.0)
        foresta.size = CGSize(width: randWidth1, height: randWidth1/aspectRatio1)
        addChild(foresta)
        
        let narratrice = Sprite(usingImage: "Narratrice", referredWithName: "narratrice", withAlpha: CGFloat(1.0), onLayer: CGFloat(1))
        
        narratrice.position.x = self.frame.width/4 - narratrice.frame.width/2
        narratrice.position.y = self.frame.height/3 - narratrice.frame.height/2
        
        //narratrice.setScale(0.5)
        
        
        //localization
       var text = ""
        var txtTool = ""
        
        if (Language.getLanguage() == "it-IT")
        {   text = "Il leone è passato da qui, sei vicino"
            txtTool = "Ci sei quasi, ma non ti allontanare troppo!"
        }
        else
        {   text = "The Lion was here! Be careful!"
            txtTool = "You're almost there, but do not stray too far!"
        }
        
        
       
        
        let fumettoDX = InteractionableSprite(usingImage: "FumettoDx", referredWithName: "fumettoDX", withAlpha: CGFloat(1.0), onLayer: CGFloat(1), type: true)
        fumettoDX.position.y = 250
        fumettoDX.position.x = -150
        fumettoDX.setScale(0.5)
        fumettoDX.addText(Text: text, onLayer: CGFloat(1))
        narratrice.addChild(fumettoDX)
        tts.toSpeech(text: text, inLanguage: Language.getLanguage(), atRate: 0.45)
    
        addChild(narratrice)
        showToolbar(withHint: txtTool)
        
          // Sound.init(usingFile: "ruscello", withExtension: "mp3")
           
    
       
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
        label.fontSize = 16
        label.name = name
        label.text = text
        label.zPosition = 10
        label.fontColor = SKColor.white
        label.position = CGPoint(x: 0, y: -5)
        
        hintBar.addChild(label)
        
        addChild(hintBar)
        hintBar.run(GameViewController.showToolbar)
    }
    
    func openScene(nextScene: SKScene) {
        let transition = SKTransition.reveal(with: .left, duration: 2.0)
        nextScene.scaleMode = .aspectFill
        scene?.view?.presentScene(nextScene, transition: transition)
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
                case "backToMap":
                    tts.stopSpeaking()
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
        
    }
}

