//
//  MapGreeceScene.swift
//  DiscoveryChallenge
//
//  Created by Riccardo Barba on 09/03/17.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

import SpriteKit
import GameplayKit

class MapGreeceScene: SKScene {
    private let tts = TextToSpeech()
    private let mappa = ParralaxSprite(usingImage: "mapGreece", referredWithName: "mapGreece")
    
    override func didMove(to view: SKView) {
        
        self.anchorPoint = CGPoint(x: 0.5, y:0.5)
        
        let aspectRatio1 = view.frame.width/view.frame.height
        let randWidth1 = CGFloat(view.frame.width + 50.0)
        mappa.size = CGSize(width: randWidth1, height: randWidth1/aspectRatio1)
        addChild(mappa)
        
        let color = SKColor.black
        
        
        //localization
        
        var txtR1 = ""
        var txtR2 = ""
        var txtR3 = ""
        var txtR4 = ""
        var txtR5 = ""
        var txtTool = ""
        if (Language.getLanguage() == "it-IT")
        {
             txtR1 = "Tessaglia"
             txtR2 = "Epiro"
             txtR3 = "Etolia"
             txtR4 = "Macedonia"
             txtR5 = "Argolide"
            txtTool = "Conduci l'eroe a Micene!"
        }
        
        else
        {
            txtR1 = "Thessaly"
            txtR2 = "Epirus"
            txtR3 = "Aetolia"
            txtR4 = "Macedonia"
            txtR5 = "Argolid"
            txtTool = "Take Heracles to Mycenae"
        }
        
        
        
        
        
        
        let regione1 = SKLabelNode(text: txtR1 )
        regione1.fontSize = 24
        regione1.position.x = -120
        regione1.position.y = 145
        regione1.fontColor = color
        regione1.zPosition = 1
        addChild(regione1)
        
        let regione2 = SKLabelNode(text: txtR2 )
        regione2.fontSize = 18
        regione2.position.x = -230
        regione2.position.y = 145
        regione2.fontColor = color
        regione2.zPosition = 2
        addChild(regione2)
        
        let regione3 = SKLabelNode(text: txtR3 )
        regione3.fontSize = 24
        regione3.position.x = -100
        regione3.position.y = 60
        regione3.fontColor = color
        regione3.zPosition = 3
        regione3.zRotation = -7
        addChild(regione3)
        
        let regione4 = SKLabelNode(text: txtR4 )
        regione4.fontSize = 16
        regione4.position.x = -160
        regione4.position.y = 205
        regione4.zPosition = 4
        regione4.fontColor = color
        addChild(regione4)
        
        let regione5 = SKLabelNode(text: txtR5 )
        regione5.fontSize = 26
        regione5.position.x = -130
        regione5.position.y = -55
        regione5.zRotation = -7
        regione5.fontColor = color
        regione5.zPosition = 5
        addChild(regione5)
        
        /*  let regione6 = SKLabelNode(text: "regione6")
         regione6.fontSize = 24
         regione6.position.x = -180
         regione6.position.y = 185
         addChild(regione6)
         
         let regione7 = SKLabelNode(text: "regione7")
         regione7.fontSize = 24
         regione7.position.x = -180
         regione7.position.y = 185
         addChild(regione7)
         
         let regione8 = SKLabelNode(text: "regione8")
         regione8.fontSize = 24
         regione8.position.x = -180
         regione8.position.y = 185
         addChild(regione8)
         
         let regione9 = SKLabelNode(text: "regione9")
         regione9.fontSize = 24
         regione9.position.x = -180
         regione9.position.y = 185
         addChild(regione9)
         
         let regione10 = SKLabelNode(text: "regione10")
         regione10.fontSize = 24
         regione10.position.x = -180
         regione10.position.y = 185
         addChild(regione10) */
        
        /*let narratrice = Sprite(usingImage: "Narratrice", referredWithName: "narratrice", withAlpha: CGFloat(1.0), onLayer: CGFloat(1))
         
         narratrice.position.x = self.frame.width/4 - narratrice.frame.width/2
         narratrice.position.y = -self.frame.height/4 - narratrice.frame.height/4
         //narratrice.setScale(0.5)
         
         
         
         var text = "Il leone è passato da qui , sei vicino"
         
         //zeus.addChild(fumettoPS)
         
         let fumettoDX = InteractionableSprite(usingImage: "FumettoDx", referredWithName: "fumettoDX", withAlpha: CGFloat(1.0), onLayer: CGFloat(1), type: true)
         fumettoDX.position.y = 250
         fumettoDX.position.x = -150
         fumettoDX.setScale(0.5)
         fumettoDX.addText(Text: text, onLayer: CGFloat(1))
         narratrice.addChild(fumettoDX)
         tts.toSpeech(text: text, inLanguage: "it-IT", atRate: 0.45)
         
         
         
         
         
         addChild(narratrice)
         showToolbar(withHint: "Sei quasi vicino!")
         */
        showToolbar(withHint: txtTool)
        //
    }
    
    func showToolbar(withHint text:String){
        let mapButton = Sprite(usingImage: "MapButton", referredWithName: "backToMap", withAlpha: CGFloat(1.0), onLayer: CGFloat(0))
        mapButton.position.y = frame.maxY - mapButton.size.height/2 + 10
        mapButton.position.x = frame.maxX - mapButton.size.width/2
        mapButton.zPosition = 10
        mapButton.alpha = 0
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
