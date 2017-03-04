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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(TAG, "touchesBegan")
        super.touchesBegan(touches, with: event)
        parent?.touchesBegan(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(TAG, "touchesEnded")
        super.touchesEnded(touches, with: event)
        parent?.touchesEnded(touches, with: event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(TAG, "touchesMoved")
        super.touchesMoved(touches, with: event)
    }
    
    func addChild(component: SKNode) {
        super.addChild(component)
    }
    
    func addText(Text t: String) {
//        print(TAG, t.characters.count)
//        print(TAG, Int(super.size.width))
        
        let spacePerLetter = 20
        let totalWidthOfText = t.characters.count * spacePerLetter
        let numberOfRow: Int = (totalWidthOfText / Int(super.size.width))
        let charactersForRow: Int = t.characters.count / numberOfRow
        var charactersAddedd: Int = 0
        
        var to, from: String.Index
        var label: SKLabelNode
        var positionY = CGFloat((size.height/2) - 160)
        
        //print(TAG, charactersForRow)
        repeat{
            
            label = SKLabelNode(fontNamed: "Chalkduster")
            label.fontSize = 18
            label.zPosition = 2
            label.fontColor = SKColor.black
            label.position = CGPoint(x: 0, y: positionY)
            
            from = t.index(t.startIndex, offsetBy: charactersAddedd)
            
            if charactersForRow+charactersAddedd < t.characters.count{
                to = t.index(t.startIndex, offsetBy: charactersForRow+charactersAddedd)
            }else{
                to = t.index(t.startIndex, offsetBy: t.characters.count)
            }
            
            label.text = t.substring(with: Range<String.Index>(uncheckedBounds: (lower: from, upper: to)))
            addChild(label)
            
            charactersAddedd += charactersForRow
            positionY.add(CGFloat(-20.0))
            //print(label.text!)
        }while charactersAddedd < t.characters.count
    }
}
