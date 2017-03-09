//
//  Arrow.swift
//  SlingShot
//
//  Created by Alberto Volpe on 08/03/2017.
//  Copyright © 2017 Kostas Aggelopoulos. All rights reserved.
//

import Foundation
import SpriteKit

class Arrow: SKSpriteNode {
    
    init() {
        
        let arrow = SKTexture(imageNamed: "bowArrow")
        super.init(texture: arrow, color: UIColor.clear, size: arrow.size())
        self.physicsBody = SKPhysicsBody(rectangleOf: size)
        self.physicsBody?.isDynamic = false
        self.name = "Arrow"
        self.physicsBody?.categoryBitMask = BodyType.bowArrow.rawValue
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.collisionBitMask = BodyType.lion.rawValue
        self.physicsBody?.contactTestBitMask = BodyType.lion.rawValue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
