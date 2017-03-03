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
    
    private var background = BackgroundSprite(usingImage: "Forest", referredWithName: "forest")
    private var tts = TextToSpeech()
    
    override func didMove(to view: SKView) {
        
        self.anchorPoint = CGPoint(x: 0.5, y:0.5)
        
        background.position = CGPoint(x:0,y:0)
        background.size = view.bounds.size
        addChild(background)
        
        let papyrus = Sprite(usingImage: "Papyrus", referredWithName: "papyrus", withAlpha: CGFloat(0.8), onLayer: CGFloat(1))
        papyrus.size.width = size.width/3
        papyrus.size.height = size.height-100
        
        //papiro posto nell'ultimo terzo dello schermo così diamo più spazio per le interazioni
        papyrus.position = CGPoint(x: size.width/3, y: 50)
        
        let narrativa1Leone = Sprite(usingImage: "Narrativa_1_Leone", referredWithName: "narrativa1Leone", withAlpha: CGFloat(1.0), onLayer: CGFloat(2))
        
        papyrus.addChild(component: narrativa1Leone)
        addChild(papyrus)
        
        tts.toSpeech(text: "Nell’Argolide, storica regione dell’antica Grecia, c'era una valle chiamata Nemea dove viveva uno spaventoso leone, nato da Tifone e da Echidna, che terrorizzava tutti gli uomini. Questo leone era invulnerabile, nessuna arma era capace di scalfire la sua durissima pelle; zanne ed artigli erano dure quanto il metallo.", inLanguage: "it-IT", atRate: 0.45)
    }
    
    override func update(_ currentTime: TimeInterval) {

    }
}

