//
//  GameScene.swift
//  test
//
//  Created by Gianfranco Bottiglieri on 09/04/2017.
//  Copyright © 2017 Gianfranco Bottiglieri. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion

class SmallVillageScene: SKScene {
    
    let tts = TextToSpeech()
    private var background = ParralaxSprite(usingImage: "SmallVillage", referredWithName: "background")
    private var sound, language: Sprite?
    
    override func didMove(to view: SKView) {
        
        self.anchorPoint = CGPoint(x: 0.5, y:0.5)
        
        //AnimalSound.init(usingFile: "ruscello", withExtension: "mp3")
        //AnimalSound.on()
        
        //Add to the Scene the Background
        
            // resize sprite
//        let aspectRatio0 = background.size.width/background.size.height
//        let randWidth0 = CGFloat(view.frame.width + 50)
//        background.size = CGSize(width: randWidth0, height: randWidth0/aspectRatio0)
        addChild(background)
        
        
        
        //Add to the Scene the firstHouse
        let house1 = Sprite(usingImage: "House1", referredWithName: "house1", withAlpha: CGFloat(1.0), onLayer: CGFloat(1))
        house1.position.x = -(frame.maxX - (house1.size.width/2 + 50))
        house1.zPosition = 5
        let aspectRatio1 = house1.size.width/house1.size.height
        let randWidth1 = CGFloat(house1.size.width/3) * 1.4
        house1.size = CGSize(width: randWidth1, height: randWidth1/aspectRatio1)
        addChild(house1)
        
        
        
        
        //Add to the Scene the secondHouse
        let house2 = Sprite(usingImage: "House1", referredWithName: "house2", withAlpha: CGFloat(1.0), onLayer: CGFloat(1))
        house2.position.x = -(frame.maxX - (house2.size.width/4))
        house2.position.y = -(frame.maxY - (house2.size.width/2))
        house2.zPosition = 6
        let aspectRatio2 = house2.size.width/house2.size.height
        let randWidth2 = CGFloat(house2.size.width/3) * 1.8
        house2.size = CGSize(width: randWidth2, height: randWidth2/aspectRatio2)
        addChild(house2)
        
        
        
        //Add to the Scene the secondHouse
        let house3 = Sprite(usingImage: "House2", referredWithName: "house3", withAlpha: CGFloat(1.0), onLayer: CGFloat(1))
        house3.position.x = -(frame.maxX - (house3.size.width/2 + 20))
        house3.position.y = -(frame.maxY - (house3.size.width/2 - 50))
        house3.zPosition = 7
        let aspectRatio3 = house3.size.width/house3.size.height
        let randWidth3 = CGFloat(house3.size.width/3) * 1.8
        house3.size = CGSize(width: randWidth3, height: randWidth3/aspectRatio3)
        addChild(house3)
        
        
        
        let narratrice = Sprite(usingImage: "Narratrice", referredWithName: "narratrice", withAlpha: CGFloat(1.0), onLayer: CGFloat(1))
        
        narratrice.position.x = self.frame.width/4 - narratrice.frame.width/2
        narratrice.position.y = -self.frame.height/4 - narratrice.frame.height/4
        //narratrice.setScale(0.5)
        
        //localization 
        var txt = ""
        var txtTool = ""
        if (Language.getLanguage() == "it-IT")

        { txt = "Il leone ha terrorizato questo villaggio, sei vicino, continua a cercare"
          txtTool = "Un piccolo villaggio…"
        }
        else
        
        {   txt = "The Lion has terrorized this village, you are close, keeps trying"
            txtTool = "A small village..."}
        
        //zeus.addChild(fumettoPS)
        
        let fumettoDX = InteractionableSprite(usingImage: "FumettoDx", referredWithName: "fumettoDX", withAlpha: CGFloat(1.0), onLayer: CGFloat(1), type: true)
        fumettoDX.position.y = 250
        fumettoDX.position.x = -150
        fumettoDX.setScale(0.5)
        fumettoDX.addText(Text: txt, onLayer: CGFloat(1))
        narratrice.addChild(fumettoDX)
        tts.toSpeech(text: txt, inLanguage: Language.getLanguage(), atRate: 0.45)
        
        
        
        
        
        addChild(narratrice)
        
        
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
        showToolbar(withHint: txtTool)
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
        self.background.parallaxMove()
    }
}
