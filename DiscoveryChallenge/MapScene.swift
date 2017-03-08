//
//  Scene1.swift
//  DiscoveryChallenge
//
//  Created by Alberto Volpe on 01/03/2017.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class MapScene: SKScene {
    
    private let tts = TextToSpeech()
    private let sky = ParralaxSprite(usingImage: "Sky", referredWithName: "sky")

    override func didMove(to view: SKView) {
        
        self.anchorPoint = CGPoint(x: 0.5, y:0.5)
        
        let aspectRatio1 = view.frame.width/view.frame.height
        let randWidth1 = CGFloat(view.frame.width + 50.0)
        sky.size = CGSize(width: randWidth1, height: randWidth1/aspectRatio1)
        addChild(sky)
        
        let map = Sprite(usingImage: "Map", referredWithName: "map", withAlpha: CGFloat(1.0), onLayer: CGFloat(1))
        
        let fish = Sprite(usingImage: "Fish", referredWithName: "fish", withAlpha: CGFloat(0.6), onLayer: CGFloat(1))
        fish.position.y = 140
        fish.position.x = 45
        map.addChild(fish)
        
        let micene = InteractionableSprite(usingImage: "Micene", referredWithName: "micene", withAlpha: CGFloat(1.0), onLayer: CGFloat(1))
        micene.position.y = -205
        micene.position.x = 180
        map.addChild(micene)
        
        let village1 = Sprite(usingImage: "Village", referredWithName: "village", withAlpha: CGFloat(0.6), onLayer: CGFloat(1))
        village1.position.y = -120
        village1.position.x = -350
        map.addChild(village1)
        
        let cavern = Sprite(usingImage: "Cavern", referredWithName: "cavern", withAlpha: CGFloat(0.6), onLayer: CGFloat(1))
        cavern.position.y = -15
        cavern.position.x = -550
        map.addChild(cavern)
        
        addChild(map)
        
        let papyrus = Sprite(usingImage: "Papyrus", referredWithName: "papyrus", withAlpha: CGFloat(0.8), onLayer: CGFloat(3))
        papyrus.size.width = size.width / 3
        papyrus.size.height = size.height - 100
        papyrus.position = CGPoint(x: size.width/3, y: 50)
        
        let narratrice = Sprite(usingImage: "Narratrice", referredWithName: "narratrice", withAlpha: CGFloat(2.0), onLayer: CGFloat(3))
        
        narratrice.position.x = size.width / 4 - (narratrice.size.width/3)*2
        papyrus.addChild(narratrice)
    
//        papyrus.addText(Text: "Nell’Argolide, storica regione dell’antica Grecia, c'era una valle chiamata Nemea dove viveva uno spaventoso leone, nato da Tifone e da Echidna, che terrorizzava tutti gli uomini. Questo leone era invulnerabile, nessuna arma era capace di scalfire la sua durissima pelle; zanne ed artigli erano dure quanto il metallo.", onLayer: CGFloat(2))
//        
//        addChild(papyrus)
//        tts.toSpeech(text: "Nell’Argòlide, storica regione dell’antica Grecia, c'era una valle chiamata Nemea, dove viveva uno spaventoso leone, nato da Tifone e da Echidna, che terrorizzava tutti gli uomini. Questo leone era invulnerabile, nessuna arma era capace di scalfire la sua durissima pelle; zanne ed artigli erano dure quanto il metallo.", inLanguage: "it-IT", atRate: 0.45)
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
                case "micene":
                    openScene(nextScene: IntroScene(size: scene!.size))
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
        
        //do nothing
        
    }
}

