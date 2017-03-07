//
//  BackgroundSprite.swift
//  DiscoveryChallenge
//
//  Created by Alberto Volpe on 03/03/2017.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit
import CoreMotion

class ParralaxSprite: Sprite {
    
    private let TAG = "ParralaxSprite"
    let motionManager = CMMotionManager()
    var destY: CGFloat  = 0.0
    
    init(usingImage assetName: String, referredWithName name: String) {

        super.init(usingImage: assetName, referredWithName: name, withAlpha: CGFloat(1.0), onLayer: CGFloat(0))
    
        position = CGPoint(x:0,y:0)
        
        let aspectRatio1 = self.size.width/self.size.height
        let randWidth1 = CGFloat(self.size.width + 50)
        self.size = CGSize(width: randWidth1, height: randWidth1/aspectRatio1)
        
        
        if motionManager.isAccelerometerAvailable == true {
            motionManager.startAccelerometerUpdates(to: OperationQueue.current!, withHandler:{
                data, error in
                
                var currentY = self.position.y
                
                // 3
                if data!.acceleration.y < 0.0 {
                    if ( self.destY > -20.0) {
                        self.destY = currentY + CGFloat((data?.acceleration.y)! * 50)
                    }
                }
                    
                else if data!.acceleration.y > 0.0 {
                    if ( self.destY < 20.0) {
                        self.destY = currentY + CGFloat((data?.acceleration.y)! * 50)
                    }
                }
                
            })
            
        }

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(TAG, "touchesBegan")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(TAG, "touchesEnded")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(TAG, "touchesMoved")
    }
    
    func parallaxMove() {
        self.run(SKAction.moveTo(x: self.destY, duration: 0.1))
    }
}
