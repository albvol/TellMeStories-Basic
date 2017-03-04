//
//  InteractionableSprite.swift
//  DiscoveryChallenge
//
//  Created by Alberto Volpe on 03/03/2017.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit
import CoreMotion

class InteractionableSprite: Sprite {
    
    static let downScale = SKAction.init(named: "DownScale")!
    static let upScale = SKAction.init(named: "UpScale")!
    static let levitate = SKAction.init(named: "levitate")!
    //static let interactionSound = SKAction.playSoundFileNamed("ding.wav", waitForCompletion: true);
    private let TAG = "InteractionableSprite"
    
    override init(usingImage assetName: String, referredWithName name: String, withAlpha alpha: CGFloat, onLayer z: CGFloat) {
        
        super.init(usingImage: assetName, referredWithName: name, withAlpha: alpha, onLayer: z)
        run(InteractionableSprite.levitate, withKey: "fadeInOut")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(TAG, "touchesBegan")
        //run(interactionSound)
        run(InteractionableSprite.upScale, withKey: "fadeInOut")

    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(TAG, "touchesEnded")
        //run(interactionSound)
        run(InteractionableSprite.downScale, withKey: "fadeInOut")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        print(TAG, "touchesMoved")
    }
}
