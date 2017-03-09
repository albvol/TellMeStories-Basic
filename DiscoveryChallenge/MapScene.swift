//
//  Scene1.swift
//  DiscoveryChallenge
//
//  Created by Alberto Volpe on 01/03/2017.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class MapScene: SKScene {
    
    private let sky = Sprite(usingImage: "Sky", referredWithName: "background", withAlpha: CGFloat(1.0), onLayer: CGFloat(0))

    override func didMove(to view: SKView) {
        
        self.anchorPoint = CGPoint(x: 0.5, y:0.5)
        
        let aspectRatio1 = view.frame.width/view.frame.height
        let randWidth1 = CGFloat(view.frame.width + 50.0)
        sky.size = CGSize(width: randWidth1, height: randWidth1/aspectRatio1)
        addChild(sky)
        
        //Set and show the Sun Sprite
        let sun = ParralaxSprite(usingImage: "Sun", referredWithName: "sun")
        sun.alpha = 0
        sun.zPosition = 0
        sun.position.y = frame.maxY - sun.size.height/2
        sun.position.x = frame.minX + sun.size.width/2
        
        addChild(sun)
        sun.run(GameViewController.fadeIn)
        
        //Show the Toolbar
        if (Language.getLanguage() == "it-IT")
        
        {showToolbar(withHint: "Benvenuto! Dirigiti a Micene!")}
        else
        {showToolbar(withHint: "Welcome hero, head to Mycenae")}
        
        
        //Set and show the Map Sprite with the elements
        let map = PanSprite(usingImage: "Map", referredWithName: "map", withAlpha: CGFloat(1.0), onLayer: CGFloat(1))
        
        let fish = Sprite(usingImage: "Fish", referredWithName: "fish", withAlpha: CGFloat(0.6), onLayer: CGFloat(1))
        fish.position.y = 140
        fish.position.x = 45
        map.addChild(fish)
        
        let micene = InteractionableSprite(usingImage: "Micene", referredWithName: "micene", withAlpha: CGFloat(1.0), onLayer: CGFloat(1))
        micene.position.y = -205
        micene.position.x = 180
        map.addChild(micene)
        
        let village1 = Sprite(usingImage: "Village", referredWithName: "village", withAlpha: CGFloat(1.0), onLayer: CGFloat(1))
        village1.position.y = -120
        village1.position.x = -350
        map.addChild(village1)
        
        let cavern = Sprite(usingImage: "Cavern", referredWithName: "cavern", withAlpha: CGFloat(1.0), onLayer: CGFloat(1))
        cavern.position.y = -15
        cavern.position.x = -550
        map.addChild(cavern)
        
        let forest = Sprite(usingImage: "ForestIcon", referredWithName: "forest", withAlpha: CGFloat(1.0), onLayer: CGFloat(1))
        forest.position.y = 100
        forest.position.x = 550
        forest.setScale(0.3)
          map.addChild(forest)
        
        map.position.y = frame.minY + map.size.height/2 - 200
        addChild(map)
        //map.run(GameViewController.showUp)
    }
    
    func showToolbar(withHint text:String){
        let mapButton = Sprite(usingImage: "MapButton", referredWithName: "backToMap", withAlpha: CGFloat(1.0), onLayer: CGFloat(0))
        mapButton.position.y = frame.maxY - mapButton.size.height/2 + 10
        mapButton.position.x = frame.maxX - mapButton.size.width/2
        mapButton.zPosition = 10
        mapButton.alpha = 0
        addChild(mapButton)
        mapButton.run(GameViewController.showToolbar)
        
        let hintBar = Sprite(usingImage: "HintBar", referredWithName: "hintBar", withAlpha: CGFloat(1.0), onLayer: CGFloat(0))
        hintBar.position.y = frame.maxY - mapButton.size.height/2 + 10
        hintBar.zPosition = 10
        hintBar.position.x = frame.maxX - hintBar.size.width/2 - mapButton.size.width
        
        let label = SKLabelNode(fontNamed: "Chalkduster")
        label.fontSize = 23
        label.name = name
        label.text = text
        label.zPosition = 10
        label.fontColor = SKColor.white
        label.position = CGPoint(x: 0, y: -5)
        
        hintBar.addChild(label)
        
        addChild(hintBar)
        hintBar.run(GameViewController.showToolbar)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches {
            let node = self.atPoint(t.location(in: self))
            
            if node.name != nil {
                switch node.name! {
                default:
                    node.touchesEnded(touches, with: event)
                }
            }
        }
    }
    
    func openScene(nextScene: SKScene) {
        let transition = SKTransition.reveal(with: .left, duration: 2.0)
        nextScene.scaleMode = .aspectFill
        scene?.view?.presentScene(nextScene, transition: transition)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches {
            let node = self.atPoint(t.location(in: self))
            
            if node.name != nil {
                switch node.name! {
                case "micene":
                    openScene(nextScene: ErcoleAtMicene(size: scene!.size))
                case "village":
                    openScene(nextScene: SmallVillageScene(size: scene!.size))
                case "cavern":
                    openScene(nextScene: LionScene(size: scene!.size))
                case "forest":
                    openScene(nextScene: MapGreeceScene(size: scene!.size))
                default:
                    node.touchesBegan(touches, with: event)
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches { self.atPoint(t.location(in: self)).touchesMoved(touches, with: event) }
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        //do nothing
        
    }
}

