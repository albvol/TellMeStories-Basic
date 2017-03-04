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

class Scene1: SKScene {
    
    private let tts = TextToSpeech()
    private let sky = BackgroundSprite(usingImage: "Sky", referredWithName: "sky")

    override func didMove(to view: SKView) {
        
        self.anchorPoint = CGPoint(x: 0.5, y:0.5)
        
        let aspectRatio1 = view.frame.width/view.frame.height
        let randWidth1 = CGFloat(view.frame.width + 50.0)
        sky.size = CGSize(width: randWidth1, height: randWidth1/aspectRatio1)
        addChild(sky)
        
        let map = DraggableSprite(usingImage: "Map", referredWithName: "map", withAlpha: CGFloat(1.0), onLayer: CGFloat(1))
        
        let fish = InteractionableSprite(usingImage: "Fish", referredWithName: "fish", withAlpha: CGFloat(1.0), onLayer: CGFloat(1))
        fish.position.y = 150
        map.addChild(fish)
        
        addChild(map)
        
        let papyrus = Sprite(usingImage: "Papyrus", referredWithName: "papyrus", withAlpha: CGFloat(0.8), onLayer: CGFloat(2))
        papyrus.size.width = size.width / 3
        papyrus.size.height = size.height - 100
        papyrus.position = CGPoint(x: size.width/3, y: 50)
        
        let narratrice = Sprite(usingImage: "Narratrice", referredWithName: "narratrice", withAlpha: CGFloat(2.0), onLayer: CGFloat(4))
        
        narratrice.position.x = size.width / 4 - (narratrice.size.width/3)*2
        papyrus.addChild(narratrice)
    
        papyrus.addText(Text: "Nell’Argolide, storica regione dell’antica Grecia, c'era una valle chiamata Nemea dove viveva uno spaventoso leone, nato da Tifone e da Echidna, che terrorizzava tutti gli uomini. Questo leone era invulnerabile, nessuna arma era capace di scalfire la sua durissima pelle; zanne ed artigli erano dure quanto il metallo.")
        
        addChild(papyrus)
        tts.toSpeech(text: "Nell’Argòlide, storica regione dell’antica Grecia, c'era una valle chiamata Nemea, dove viveva uno spaventoso leone, nato da Tifone e da Echidna, che terrorizzava tutti gli uomini. Questo leone era invulnerabile, nessuna arma era capace di scalfire la sua durissima pelle; zanne ed artigli erano dure quanto il metallo.", inLanguage: "it-IT", atRate: 0.45)
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
        let nextScene = Scene1(size: scene!.size)
        nextScene.scaleMode = .aspectFill
        scene?.view?.presentScene(nextScene, transition: transition)
    }
    
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

