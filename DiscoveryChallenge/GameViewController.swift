//
//  GameViewController.swift
//  DiscoveryChallenge
//
//  Created by Alberto Volpe on 28/02/2017.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import AVFoundation

class GameViewController: UIViewController {
    
    static let fadeIn = SKAction.init(named: "FadeIn")!
    static let showUp = SKAction.init(named: "showUp")!
    static let showUp2 = SKAction.init(named: "showUp2")!
    static let showToolbar = SKAction.init(named: "showToolbar")!
    static var scene: SKScene?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            
            GameViewController.scene = SKScene(fileNamed: "GameScene")!
            GameViewController.scene?.scaleMode = .resizeFill
            view.presentScene(GameViewController.scene)
            view.ignoresSiblingOrder = true
            
            //view.showsFPS = true
            //view.showsNodeCount = true
            
            Sound.init(usingFile: "tune", withExtension: "mp3")
            Language.init()
            Language.change()
        }
    }
    
    static func openScene(nextScene: SKScene) {
        nextScene.scaleMode = .aspectFill
        GameViewController.scene!.view?.presentScene(nextScene, transition: SKTransition.doorway(withDuration: 1.5))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Sound.off()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Sound.on()
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
