//
//  EndScene.swift
//  DiscoveryChallenge
//
//  Created by Alberto Volpe on 09/03/2017.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class EndScene: End {
    
    private let TAG = "EndScene"
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y:0.5)
        
        var txt1 = ""
        if (Language.getLanguage() == "it-IT") {
            txt1 = "Le frecce rimbalzavano sulla pelliccia del Leone senza scalfirlo. Quindi il Leone andò via ed entrò nella sua caverna, ma Eracle non mollava e seguì la belva. Ne nacque un duello corpo a corpo dove, con astuzia, Eracle ebbe la meglio. Caricato il Leone sulle spalle, in segno di trionfo, lo portò a Micene dove lo aspettava Euristeo. Zeus,venuto a sapere dell’impresa di Eracle, volle rendere omaggio alla creatura, ponendo il Leone di Nemea fra le stelle, formando così la costellazione del leone."
        } else {
            txt1 = "The arrows keeps bouncing on the Lion's fur without damaging him. So the Lion went away and stepped into his cave, but Heracles wouldn\'t gave up and followed the beast inside. The result was a body-to-hand duel where, with foxiness, Heracles won. Loaded the lion on his shoulders, in triumph, Heracles brought him to Mycenae, where Eurystheus was waiting for him. Zeus, learned about Heracles, wanted to tribute the creature, putting the Lion of Nemea among the stars, giving birth to the constellation Leo."
        }
        
        setSequence(size: size, usingImage: "Overlay", text: txt1)
    }
    
    func openScene(nextScene: SKScene) {
        let transition = SKTransition.reveal(with: .left, duration: 2.0)
        nextScene.scaleMode = .aspectFill
        scene?.view?.presentScene(nextScene, transition: transition)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(TAG, "touchesBegan")
        super.touchesBegan(touches, with: event)
        
        for t in touches {
            let node = self.atPoint(t.location(in: self))
            
            if node.name != nil {
                switch node.name! {
                case "restart":
                    openScene(nextScene: IntroScene(size: self.size))
                default:
                    node.touchesBegan(touches, with: event)
                }
            }
            
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(TAG, "touchesEnded")
        
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
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(TAG, "touchesMoved")
        
        for t in touches { self.atPoint(t.location(in: self)).touchesMoved(touches, with: event) }
    }
    
    override func update(_ currentTime: TimeInterval) {
        //do nothing
    }
}

