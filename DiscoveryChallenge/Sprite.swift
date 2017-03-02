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
import CoreMotion

class Sprite: SKSpriteNode {
    
    static let downScale = SKAction.init(named: "DownScale")!
    static let upScale = SKAction.init(named: "UpScale")!
    static let levitate = SKAction.init(named: "levitate")!
    //static let interactionSound = SKAction.playSoundFileNamed("ding.wav", waitForCompletion: true);
    
    var active: Bool = false
    var drag: Bool = false
    var isParallax: Bool = false
    
    let motionManager = CMMotionManager()
    var destY:CGFloat  = 0.0
    
    init(usingImage assetName: String, referredWithName name: String, withAlpha alpha: CGFloat, onLayer z: CGFloat) {
        let texture = SKTexture(imageNamed: assetName)
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
        print("touchesBegan")
        if active {
            //run(interactionSound)
            run(Sprite.upScale, withKey: "fadeInOut")
        }//else{
//            super.touchesBegan(touches, with: event)
//        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesEnded")
        if active {
            //run(interactionSound)
            print("\(position)")
            run(Sprite.downScale, withKey: "fadeInOut")

         }//else{
//            super.touchesEnded(touches, with: event)
//        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesMoved")
        
        if drag {
            for t in touches {
            let positionInScene = t.location(in: self)
            let previousPosition = t.previousLocation(in: self)
            let translation = CGPoint(x: positionInScene.x - previousPosition.x, y: positionInScene.y - previousPosition.y)
                
                print("\(position)")

            //let position = .position
            
            //if selectedNode.name! == "papyrus" {
            position = CGPoint(x: position.x + translation.x, y: position.y + translation.y)
            
                
    //            selectedNode.position = CGPoint(x: position.x + translation.x, y: position.y + translation.y)
//            } else {
//                let aNewPosition = CGPoint(x: position.x + translation.x, y: position.y + translation.y)
//                
//                let winSize = self.size
//                var retval = aNewPosition
//                retval.x = CGFloat(min(retval.x, 0))
//                retval.x = CGFloat(max(retval.x, -(background.size.width) + winSize.width))
//                retval.y = self.position.y
//                
//                background.position = retval
//            }
            }
        }
    }
    
    func addChild(component: Sprite) {
        addChild(component)
    }
    
    func moveByAccelerometer(){
        self.isParallax = true
        
        let aspectRatio1 = self.size.width/self.size.height
        let randWidth1 = CGFloat(self.size.width + 50)
        self.size = CGSize(width: randWidth1, height: randWidth1/aspectRatio1)

        
        if motionManager.isAccelerometerAvailable == true {
            // 2
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
    
    func parallaxMove() {
        if ( isParallax ) {
            self.run(SKAction.moveTo(x: self.destY, duration: 0.1))
        }
    }
    
}
