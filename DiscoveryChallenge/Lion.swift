//
//  Lion.swift
//  SlingShot
//
//  Created by Alberto Volpe on 08/03/2017.
//  Copyright © 2017 Kostas Aggelopoulos. All rights reserved.
//

import Foundation
import SpriteKit

class Lion: SKSpriteNode{
    
    init() {
        
        let lion = SKTexture(imageNamed: "Lion")
        super.init(texture: lion, color: UIColor.clear, size: lion.size())
        self.physicsBody = SKPhysicsBody(circleOfRadius: lion.size().width)
        self.physicsBody?.isDynamic = false
        self.name = "Lion"
        self.zPosition = 20
        self.physicsBody?.categoryBitMask = BodyType.lion.rawValue
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.collisionBitMask = BodyType.bowArrow.rawValue
        self.physicsBody?.contactTestBitMask = BodyType.bowArrow.rawValue
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesBegan")
        AnimalSound.init(usingFile: "lion", withExtension: "wav")
        AnimalSound.on()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
