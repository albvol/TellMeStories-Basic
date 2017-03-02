//
//  Sprite.swift
//  DiscoveryChallenge
//
//  Created by Alberto Volpe on 01/03/2017.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class Sprite: SKSpriteNode {
    
    static let downScale = SKAction.init(named: "DownScale")!
    static let upScale = SKAction.init(named: "UpScale")!
    static let levitate = SKAction.init(named: "levitate")!
    //static let interactionSound = SKAction.playSoundFileNamed("ding.wav", waitForCompletion: true);
    
    var active: Bool
    
    init(usingImage assetName: String, referredWithName name: String, withAlpha alpha: CGFloat, onLayer z: CGFloat, isActive active: Bool) {
        let texture = SKTexture(imageNamed: assetName)
        self.active = active
        super.init(texture: texture, color: UIColor.clear, size: texture.size())
        super.name = name
        super.alpha = alpha
        super.zPosition = z
        
        if active { run(Sprite.levitate, withKey: "fadeInOut") }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if active {
            //run(interactionSound)
            run(Sprite.upScale, withKey: "fadeInOut")
        }//else{
//            super.touchesBegan(touches, with: event)
//        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if active {
            //run(interactionSound)
            run(Sprite.downScale, withKey: "fadeInOut")
         }//else{
//            super.touchesEnded(touches, with: event)
//        }
    }
    
    func addChild(component: Sprite) {
        addChild(component)
    }
}
