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
        self.anchorPoint = CGPoint(x: 0.5, y:0.5)
        
        let aspectRatio1 = view.frame.width/view.frame.height
        let randWidth1 = CGFloat(view.frame.width + 50.0)
        tempio.size = CGSize(width: randWidth1, height: randWidth1/aspectRatio1)
        addChild(tempio)
        
        let ercole = Sprite(usingImage: "Hercules", referredWithName: "hercules", withAlpha: CGFloat(1.0), onLayer: CGFloat(1))
        
        ercole.position.x = self.frame.width/2 - ercole.frame.width/4
        ercole.position.y = -self.frame.height/4 - ercole.frame.height/3
        
        let zeus = Sprite(usingImage: "Zeus", referredWithName: "zeus", withAlpha: CGFloat(1.0), onLayer: CGFloat(1))
        
        zeus.position.x = -self.frame.width/2 + zeus.frame.width/4
        zeus.position.y = -self.frame.height/4 - zeus.frame.height/3
        //var fumettoSize = CGSize(width: 150,height:250)
        //let fumettoPS = ReadableSprite(nameOfTextArea: "fumetto",withSize: CGSize(width: 150,height: 250), withText: "Ercole, vai a catturare il leone", fontSize: CGFloat(16), onLayer: CGFloat(2))
        let fumettoSX = InteractionableSprite(usingImage: "FumettoSx", referredWithName: "fumettoSX" , withAlpha: CGFloat(1.0), onLayer: CGFloat(1),type: true)
        fumettoSX.position.y = 250
        fumettoSX.position.x = 150
        fumettoSX.setScale(0.5)
       
        var text = "Ercole, in Nemea c'è un terribile leone che terrorizza il popolo. Voglio che tu vada lì e mi porti la sua pelliccia"
         fumettoSX.addText(Text: text, onLayer: CGFloat(2))
        zeus.addChild(fumettoSX)
        //zeus.addChild(fumettoPS)
        
        let fumettoDX = InteractionableSprite(usingImage: "FumettoDx", referredWithName: "fumettoDX", withAlpha: CGFloat(1.0), onLayer: CGFloat(1),type: true)
        fumettoDX.position.y = 250
        fumettoDX.position.x = -150
        fumettoDX.setScale(0.5)
        fumettoDX.addText(Text: "Sarà fatto!", onLayer: CGFloat(1))
        ercole.addChild(fumettoDX)
        tts.toSpeech(text: text, inLanguage: "it-IT", atRate: 0.45)
        
        text = "Sarà fatto!"
        
        // let fish = InteractionableSprite(usingImage: "Fish", referredWithName: "fish", withAlpha: CGFloat(1.0), onLayer: CGFloat(1))
        //fish.position.y = 150
        //fish.position.x = 50
        //map.addChild(fish)
        
        /*  let micene = InteractionableSprite(usingImage: "Micene", referredWithName: "micene", withAlpha: CGFloat(1.0), onLayer: CGFloat(1))
         micene.position.y = -205
         micene.position.x = 180
         map.addChild(micene)
         
         let village1 = InteractionableSprite(usingImage: "Village", referredWithName: "village", withAlpha: CGFloat(1.0), onLayer: CGFloat(1))
         village1.position.y = -120
         village1.position.x = -350
         map.addChild(village1)
         
         let cavern = InteractionableSprite(usingImage: "Cavern", referredWithName: "cavern", withAlpha: CGFloat(1.0), onLayer: CGFloat(1))
         cavern.position.y = -15
         cavern.position.x = -550
         map.addChild(cavern)*/
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
            
            self.addChild(ercole)
           self.tts.toSpeech(text: text, inLanguage: "it-IT", atRate: 0.45)
        })
        addChild(zeus)
        
        /* let papyrus = Sprite(usingImage: "Papyrus", referredWithName: "papyrus", withAlpha: CGFloat(0.8), onLayer: CGFloat(3))
         papyrus.size.width = size.width / 3
         papyrus.size.height = size.height - 100
         papyrus.position = CGPoint(x: size.width/3, y: 50)
         
         let narratrice = Sprite(usingImage: "Narratrice", referredWithName: "narratrice", withAlpha: CGFloat(2.0), onLayer: CGFloat(3))
         
         narratrice.position.x = size.width / 4 - (narratrice.size.width/3)*2
         papyrus.addChild(narratrice) */
        
        /* papyrus.addText(Text: "Nell’Argolide, storica regione dell’antica Grecia, c'era una valle chiamata Nemea dove viveva uno spaventoso leone, nato da Tifone e da Echidna, che terrorizzava tutti gli uomini. Questo leone era invulnerabile, nessuna arma era capace di scalfire la sua durissima pelle; zanne ed artigli erano dure quanto il metallo.", onLayer: CGFloat(2))
         
         addChild(papyrus) */
        
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
    
    //    func openScene(nextScene: SKScene) {
    //        let transition = SKTransition.reveal(with: .left, duration: 2.0)
    //        let nextScene = Scene2(size: scene!.size)
    //        nextScene.scaleMode = .aspectFill
    //        scene?.view?.presentScene(nextScene, transition: transition)
    //    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches {
            let node = self.atPoint(t.location(in: self))
            
            if node.name != nil {
                switch node.name! {
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

