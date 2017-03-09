//
//  LionScene.swift
//  SlingShot
//
//  Created by Kostantinos Aggelopoulos on 29/01/2016.
//  Copyright (c) 2016 Kostas Aggelopoulos. All rights reserved.
//

import SpriteKit

enum BodyType:UInt32{
    
    case bowArrow = 1
    case lion = 2
}

var bowPosition: CGPoint = CGPoint.zero

struct Settings {
    struct Metrics {
        static let projectileRadius = CGFloat(10)
        static let projectileRestPosition = bowPosition //CGPoint(x: 100, y: 50)
        static let projectileTouchThreshold = CGFloat(10)
        static let projectileSnapLimit = CGFloat(10)
        static let forceMultiplier = CGFloat(0.5)
        static let rLimit = CGFloat(50)
    }
    struct Game {
        static let gravity = CGVector(dx: 0,dy: -9.8)
    }
}

class LionScene: SKScene, SKPhysicsContactDelegate  {
    
    static let fadeIn = SKAction.init(named: "FadeIn")!
    static let showToolbar = SKAction.init(named: "showToolbar")!
    static let showUp = SKAction.init(named: "showUp")!
    static let showUp2 = SKAction.init(named: "showUp2")!
    
    var projectile: SKSpriteNode!
    var projectileIsDragged = false
    var touchCurrentPoint: CGPoint!
    var touchStartingPoint :CGPoint!
    
    override func didMove(to view: SKView) {
        
        self.anchorPoint = CGPoint(x: 0.5, y:0.5)
        self.backgroundColor = UIColor(red:0.00, green:0.85, blue:0.94, alpha:1.0)
        //        let background = Sprite(usingImage: "Sky", referredWithName: "Background", withAlpha: CGFloat(1.0), onLayer: CGFloat(-1))
        //        background.size = frame.size
        //        addChild(background)
        
        let sun = ParralaxSprite(usingImage: "Sun", referredWithName: "sun")
        sun.alpha = 0
        sun.position.y = frame.maxY - sun.size.height/2
        sun.position.x = frame.minX + sun.size.width/2
        
        addChild(sun)
        sun.run(LionScene.fadeIn)
        
        let base = Sprite(usingImage: "LionEnvironmentBase", referredWithName: "Base", withAlpha: CGFloat(0.3), onLayer: CGFloat(-1))
        base.position.y = frame.minY + base.size.height/2 - 100
        base.physicsBody?.collisionBitMask = 0
        base.physicsBody?.categoryBitMask = 0
        base.physicsBody?.contactTestBitMask = 0
        addChild(base)
        base.run(LionScene.showUp)
        
        let lionEnvironment2 = Sprite(usingImage: "LionEnvironment", referredWithName: "LionEnvironment", withAlpha: CGFloat(1.0), onLayer: CGFloat(1))
        lionEnvironment2.position.y = frame.minY + lionEnvironment2.size.height/2 - 200
        
        addChild(lionEnvironment2)
        lionEnvironment2.run(LionScene.showUp2)
        
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsWorld.gravity = Settings.Game.gravity
        physicsWorld.speed = 0.6
        physicsWorld.contactDelegate = self
        
        //Add the lion
        let lion = Lion()
        //        lion.position = CGPoint(x: 400 + (20 + 5), y:  20)
        lion.position = CGPoint(x: frame.maxX - lion.size.width, y:  0)
        
        let aspectRatio2 = lion.size.width/lion.size.height
        let randWidth2 = CGFloat(90.0)
        lion.size = CGSize(width: randWidth2, height: randWidth2/aspectRatio2)
        addChild(lion)
        
        //Add the slingshot
        let slingshot = SKSpriteNode(imageNamed: "bow")
        slingshot.position = CGPoint(x: frame.minX + slingshot.size.width/2, y: 0)
        slingshot.zPosition = 20
        
        let aspectRatio1 = slingshot.size.width/slingshot.size.height
        let randWidth1 = CGFloat(80.0)
        slingshot.size = CGSize(width: randWidth1, height: randWidth1/aspectRatio1)
        bowPosition = slingshot.position
        addChild(slingshot)
        
        //Add the Arrow
        projectile = Arrow()
        let aspectRatio = projectile.size.width/projectile.size.height
        let randWidth = CGFloat(60.0)
        self.projectile.size = CGSize(width: randWidth, height: randWidth/aspectRatio)
        projectile.position = Settings.Metrics.projectileRestPosition
        addChild(projectile)
        
        var txtTool = ""
        if (Language.getLanguage() == "it-IT") {
            txtTool = "Colpisci il leone con le frecce"
        } else {
            txtTool = "Hit the lion with the arrows"
        }
        
        showToolbar(withHint: txtTool)
    }
    
    func showToolbar(withHint text:String){
        let mapButton = Sprite(usingImage: "MapButton", referredWithName: "backToMap", withAlpha: CGFloat(1.0), onLayer: CGFloat(0))
        mapButton.position.y = frame.maxY - mapButton.size.height/2 + 10
        mapButton.position.x = frame.maxX - mapButton.size.width/2
        mapButton.zPosition = 10
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
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        if let nameB = contact.bodyB.node?.name{
            if let nameA = contact.bodyA.node?.name{
                if nameA == "Lion" && nameB == "Arrow"{
                    //projectile.removeFromParent()
                    openScene(nextScene: EndScene(size: self.size))
                    print("Contact made")
                }
            }
        }
    }
    
    func fingerDistanceFromProjectileRestPosition(_ projectileRestPosition: CGPoint, fingerPosition: CGPoint) -> CGFloat {
        return sqrt(pow(projectileRestPosition.x - fingerPosition.x,2) + pow(projectileRestPosition.y - fingerPosition.y,2))
    }
    
    func projectilePositionForFingerPosition(_ fingerPosition: CGPoint, projectileRestPosition:CGPoint, circleRadius rLimit:CGFloat) -> CGPoint {
        let φ = atan2(fingerPosition.x - projectileRestPosition.x, fingerPosition.y - projectileRestPosition.y)
        let cX = sin(φ) * rLimit
        let cY = cos(φ) * rLimit
        return CGPoint(x: cX + projectileRestPosition.x, y: cY + projectileRestPosition.y)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        func shouldStartDragging(_ touchLocation:CGPoint, threshold: CGFloat) -> Bool {
            let distance = fingerDistanceFromProjectileRestPosition(
                Settings.Metrics.projectileRestPosition,
                fingerPosition: touchLocation
            )
            return distance < Settings.Metrics.projectileRadius + threshold
        }
        
        if let touch = touches.first {
            let touchLocation = touch.location(in: self)
            
            if !projectileIsDragged && shouldStartDragging(touchLocation, threshold: Settings.Metrics.projectileTouchThreshold)  {
                touchStartingPoint = touchLocation
                touchCurrentPoint = touchLocation
                projectileIsDragged = true
            }
        }

        for t in touches {
            let node = self.atPoint(t.location(in: self))
            if node.name != nil {
                switch node.name! {
                case "Lion":
                    node.touchesBegan(touches, with: event)
                case "backToMap":
                    openScene(nextScene: MapScene(size: self.size))
                default:
                    break
                }
            }
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if projectileIsDragged {
            if let touch = touches.first {
                let touchLocation = touch.location(in: self)
                let distance = fingerDistanceFromProjectileRestPosition(touchLocation, fingerPosition: touchStartingPoint)
                if distance < Settings.Metrics.rLimit  {
                    touchCurrentPoint = touchLocation
                } else {
                    touchCurrentPoint = projectilePositionForFingerPosition(
                        touchLocation,
                        projectileRestPosition: touchStartingPoint,
                        circleRadius: Settings.Metrics.rLimit
                    )
                }
                
            }
            projectile.position = touchCurrentPoint
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if projectileIsDragged {
            projectileIsDragged = false
            let distance = fingerDistanceFromProjectileRestPosition(touchCurrentPoint, fingerPosition: touchStartingPoint)
            if distance > Settings.Metrics.projectileSnapLimit {
                let vectorX = touchStartingPoint.x - touchCurrentPoint.x
                let vectorY = touchStartingPoint.y - touchCurrentPoint.y
                projectile.physicsBody = SKPhysicsBody(circleOfRadius: Settings.Metrics.projectileRadius)
                projectile.physicsBody?.applyImpulse(
                    CGVector(
                        dx: vectorX * Settings.Metrics.forceMultiplier,
                        dy: vectorY * Settings.Metrics.forceMultiplier
                    )
                )
            } else {
                projectile.physicsBody = nil
                projectile.position = Settings.Metrics.projectileRestPosition
            }
        }
    }
    
    func openScene(nextScene: SKScene) {
        let transition = SKTransition.reveal(with: .left, duration: 2.0)
        nextScene.scaleMode = .aspectFill
        scene?.view?.presentScene(nextScene, transition: transition)
    }
}
