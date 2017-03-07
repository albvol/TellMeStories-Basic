//
//  Intro.swift
//  DiscoveryChallenge
//
//  Created by Alberto Volpe on 06/03/2017.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

/* Da Aggiustare!
   Posizione dell'actor e dell'introText 
*/
class Intro: SKScene {
    
    private let TAG = "Intro"
    private var background: ParralaxSprite?
    
    func setSequence(size: CGSize, usingImage assetName: String, text: String, actorPic resourceName: String) {
        
        self.anchorPoint = CGPoint(x: 0.5, y:0.5)
        
        //Create, Poisition and Add to the Scene the Background Sprite
        background = ParralaxSprite(usingImage: "Overlay", referredWithName: "background")
        addChild(background!)
        
        //Create, Poisition and Add to the Scene the Actor Sprite
        let actor = Sprite(usingImage: resourceName, referredWithName: "actor", withAlpha: CGFloat(1.0), onLayer: CGFloat(1))
        actor.position.x = frame.maxX - (actor.size.width/2) - 16
        background?.addChild(actor)
        
        //Prepare the size of the Text Sprite
        var sizeOfTextArea = size
        sizeOfTextArea.width -= actor.size.width
        
        //Create, Poisition and Add to the Scene the Text Readable Sprite
        let introText = ReadableSprite(nameOfTextArea:"introText", withSize: sizeOfTextArea, withText: text, fontSize: CGFloat(30), onLayer: CGFloat(1))
        introText.position.x = frame.minX + (sizeOfTextArea.width/2) + 16
        addChild(introText)
    }
    
    override func didMove(to view: SKView) {}
        
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(TAG, "touchesBegan")
        if let touch = touches.first {
            let node = self.atPoint(touch.location(in: self))
            node.touchesBegan(touches, with: event)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(TAG, "touchesEnded")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(TAG, "touchesMoved")
    }
    
    override func update(_ currentTime: TimeInterval) {
        //do nothing
    }
}
