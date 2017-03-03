//
//  DraggableSprite.swift
//  DiscoveryChallenge
//
//  Created by Alberto Volpe on 03/03/2017.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit
import CoreMotion

class DraggableSprite: Sprite {
    
    private let TAG = "DraggableSprite"
    let motionManager = CMMotionManager()
    var destY: CGFloat  = 0.0
    
    override init(usingImage assetName: String, referredWithName name: String, withAlpha alpha: CGFloat, onLayer z: CGFloat) {
        super.init(usingImage: assetName, referredWithName: name, withAlpha: alpha, onLayer: z)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        print(TAG, "touchesBegan")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        print(TAG, "touchesEnded")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)

        print(TAG, "touchesMoved")
        for t in touches {
            let positionInScene = t.location(in: self)
            let previousPosition = t.previousLocation(in: self)
            let translation = CGPoint(x: positionInScene.x - previousPosition.x, y: positionInScene.y - previousPosition.y)
            
            position = CGPoint(x: position.x + translation.x, y: position.y + translation.y)
        }
    }
}
