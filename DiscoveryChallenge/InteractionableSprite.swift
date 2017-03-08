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
    var flag = false
    //static let interactionSound = SKAction.playSoundFileNamed("ding.wav", waitForCompletion: true);
    private let TAG = "InteractionableSprite"
    
    override init(usingImage assetName: String, referredWithName name: String, withAlpha alpha: CGFloat, onLayer z: CGFloat) {
        
        super.init(usingImage: assetName, referredWithName: name, withAlpha: alpha, onLayer: z)
        run(InteractionableSprite.levitate, withKey: "fadeInOut")
    }
    
    init(usingImage assetName: String, referredWithName name: String, withAlpha alpha: CGFloat, onLayer z: CGFloat,type flag: Bool)
    {
        super.init(usingImage: assetName, referredWithName: name, withAlpha: alpha, onLayer: z)

        if(flag == true)
        {
            self.flag = true
            run(InteractionableSprite.levitate,withKey: "fadeInOut")
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(TAG, "touchesBegan")
        //run(interactionSound)
        if(flag == false){
        run(InteractionableSprite.upScale, withKey: "fadeInOut")
        }
        print(flag)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(TAG, "touchesEnded")
        //run(interactionSound)
        if flag == false{
        run(InteractionableSprite.downScale, withKey: "fadeInOut")
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        print(TAG, "touchesMoved")
    }
    
    func addText(Text t: String, onLayer z: CGFloat) {
        //        print(TAG, t.characters.count)
        //        print(TAG, Int(super.size.width))
        
        let spacePerLetter = 20
        let totalWidthOfText = t.characters.count * spacePerLetter
        let numberOfRow: Int = (totalWidthOfText / Int(super.size.width))
        print("Number rows: \(numberOfRow)")
        var charactersForRow = 30
       // if( numberOfRow != 0) {
       // charactersForRow = t.characters.count / numberOfRow
       // }
       // else {
       //
       // }
        var charactersAddedd: Int = 0
        
        var to, from: String.Index
        var label: SKLabelNode
        var positionY = CGFloat((size.height/2) - 80)
        
        //print(TAG, charactersForRow)
        repeat{
            
            label = SKLabelNode(fontNamed: "Chalkduster")
            label.fontSize = 24
            label.zPosition = z
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
