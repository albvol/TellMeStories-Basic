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

class ErcoleAtMicene: SKScene {
    
    private let tts = TextToSpeech()
    private let tempio = ParralaxSprite(usingImage: "Tempio", referredWithName: "tempio")
    
    override func didMove(to view: SKView) {
        print("Inizio la scena")
        print("\(GameViewController.MiceneVisited)")
        self.anchorPoint = CGPoint(x: 0.5, y:0.5)
        
        let aspectRatio1 = view.frame.width/view.frame.height
        let randWidth1 = CGFloat(view.frame.width + 50.0)
        tempio.size = CGSize(width: randWidth1, height: randWidth1/aspectRatio1)
        addChild(tempio)
        
        let ercole = Sprite(usingImage: "Spartan", referredWithName: "spartan", withAlpha: CGFloat(1.0), onLayer: CGFloat(1))
        
        ercole.position.x = self.frame.width/2 - ercole.frame.width/4 + 10
        ercole.position.y = -self.frame.height/4 - ercole.frame.height/3 + 130
        
        let zeus = Sprite(usingImage: "Zeus", referredWithName: "zeus", withAlpha: CGFloat(1.0), onLayer: CGFloat(1))
        
        zeus.position.x = -self.frame.width/2 + zeus.frame.width/4
        zeus.position.y = -self.frame.height/4 - zeus.frame.height/3
        //var fumettoSize = CGSize(width: 150,height:250)
        //let fumettoPS = ReadableSprite(nameOfTextArea: "fumetto",withSize: CGSize(width: 150,height: 250), withText: "Ercole, vai a catturare il leone", fontSize: CGFloat(16), onLayer: CGFloat(2))
        let fumettoSX = InteractionableSprite(usingImage: "FumettoSx", referredWithName: "fumettoSX" , withAlpha: CGFloat(1.0), onLayer: CGFloat(1), type: true)
        fumettoSX.position.y = 250
        fumettoSX.position.x = 150
        fumettoSX.setScale(0.5)
       
        
        //localization
        var text = ""
        var textHercules = ""
        var txtTool = ""
        
        if(!GameViewController.MiceneVisited){
            
            switch Language.getLanguage(){
                case "it-IT":
                    text = "Ercole, in Nemea c'è un terribile leone che terrorizza il popolo. Voglio che tu vada lì e mi porti la sua pelliccia"
                    textHercules = "Conta su di me!"
                    txtTool = "Sei arrivato a Micene!"
                default:
                    text = "Heracles, in Nemea there is a terrible Lion terrorizing the people. I want you to go there and bring to Zeus his fur"
                    textHercules = "Count on me!"
                    txtTool = "You are in Mycenae!"
            }
            
        }else{

            switch Language.getLanguage(){
                case "it-IT":
                    text = "Ercole, hai trovato il Leone? Torna da me quando l'avrai sconfitto"
                    textHercules = "Certamente!"
                    txtTool = "Sei arrivato a Micene!"
                default:
                    text = "Heracles, have you found the Lion? Come back when you will beat him"
                    textHercules = "For sure!"
                    txtTool = "You are in Mycenae!"
            }
        }
        
        
        fumettoSX.addText(Text: text, onLayer: CGFloat(2))
        zeus.addChild(fumettoSX)
        //zeus.addChild(fumettoPS)
        
        let fumettoDX = InteractionableSprite(usingImage: "FumettoDx", referredWithName: "fumettoDX", withAlpha: CGFloat(1.0), onLayer: CGFloat(1), type: true)
        fumettoDX.position.y = 160
        fumettoDX.position.x = -190
        fumettoDX.setScale(0.5)
        fumettoDX.addText(Text: textHercules, onLayer: CGFloat(1))
        ercole.addChild(fumettoDX)
        tts.toSpeech(text: text, inLanguage: Language.getLanguage(), atRate: 0.45)
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
            self.addChild(ercole)
            self.tts.toSpeech(text: textHercules, inLanguage: Language.getLanguage(), atRate: 0.45)
        })
        
        addChild(zeus)
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
                    if GameViewController.MiceneVisited {
                        tts.stopSpeaking()
                        openScene(nextScene: MapScene(size: self.size))
                    } else {
                        tts.stopSpeaking()
                        openScene(nextScene: MapGreeceScene(size: self.size))
                        GameViewController.MiceneVisited = true
                    }
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

