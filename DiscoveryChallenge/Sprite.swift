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
    
    private let TAG = "Sprite"
    
    init(usingImage assetName: String, referredWithName name: String, withAlpha alpha: CGFloat, onLayer z: CGFloat) {
        let texture = SKTexture(imageNamed: assetName)
        super.init(texture: texture, color: UIColor.clear, size: texture.size())
        super.name = name
        super.alpha = alpha
        super.zPosition = z
        super.physicsBody = SKPhysicsBody(texture: texture, size: CGSize(width: texture.size().width, height: texture.size().height))
        super.physicsBody?.isDynamic = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print(TAG, "touchesBegan")
//        if let touch = touches.first {
//            super.touchesBegan(touches, with: event)
//            parent?.touchesBegan(touches, with: event)
//        }
//    }
//    
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print(TAG, "touchesEnded")
//        if let touch = touches.first {
//            super.touchesEnded(touches, with: event)
//            parent?.touchesEnded(touches, with: event)
//        }
//    }
//    
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print(TAG, "touchesMoved")
//        
//        if let touch = touches.first {
//            super.touchesMoved(touches, with: event)
//        }
//    }
    
    func addChild(component: SKNode) {
        super.addChild(component)
    }
}
