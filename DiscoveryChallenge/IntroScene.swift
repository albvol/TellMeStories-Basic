//
//  IntroScene.swift
//  DiscoveryChallenge
//
//  Created by Alberto Volpe on 06/03/2017.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class IntroScene: Intro {
    
    private let TAG = "IntroScene"
        
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y:0.5)
        setSequence(size: size, usingImage: "Overlay", text: "Nell’Argolide, storica regione dell’antica Grecia, c’era una valle chiamata Nemea dove viveva uno spaventoso leone, nato da Tifone e da Echidna, che terrorizzava tutti gli uomini. Questo leone era invulnerabile, nessuna arma era capace di scalfire la sua durissima pelle; zanne ed artigli erano dure quanto il metallo.", text2: "Uniamoci ad Eracle in questa emozionante avventura e scopriamo la nascita della costellazione del leone. Tutto ebbe inizio a Micene...", actorPic: "Narratrice")
    }
        
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(TAG, "touchesBegan")
        super.touchesBegan(touches, with: event)
        
        for t in touches {
            let node = self.atPoint(t.location(in: self))
            
            if node.name != nil {
                switch node.name! {
                case "next":
                    print("HO PREMUTO ", node.name!)
                    GameViewController.openScene(nextScene: MainMapScene(size: self.size))
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
