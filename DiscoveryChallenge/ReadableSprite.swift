//
//  ReadableSprite.swift
//  DiscoveryChallenge
//
//  Created by Alberto Volpe on 06/03/2017.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

/*
 touchesBegan -> restartSpeaking fa crashare l'app: GUARDARE CLASSE TEXTTOSPEECH
 
 
 TESTO INTRO ACCENTATO: "Nell’Argòlide, storica regione dell’antica Grecia, c'era una valle chiamata Nemea, dove viveva uno spaventoso leone, nato da Tifone e da Echidna, che terrorizzava tutti gli uomini. Questo leone era invulnerabile, nessuna arma era capace di scalfire la sua durissima pelle; zanne ed artigli erano dure quanto il metallo."
 */
class ReadableSprite: SKSpriteNode{
    
    private let TAG = "ReadableSprite"
    private let tts = TextToSpeech()
    
    init(nameOfTextArea name: String, withSize size: CGSize, withText text: String, fontSize fSize: CGFloat, onLayer layer: CGFloat){
        super.init(texture: nil, color: UIColor.clear, size: size)
        addText(nameOfTextArea: name, text: text, fontSize: fSize, onLayer: layer)
        
        tts.toSpeech(text: text, inLanguage: Language.getLanguage(), atRate: 0.45)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //At the touch of the user on the text the app crash!!!
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(TAG, "touchesBegan")
        tts.restartSpeaking()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(TAG, "touchesEnded")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(TAG, "touchesMoved")
    }
    
    //Place the label to show the text
    func addText(nameOfTextArea name: String, text t: String, fontSize fSize: CGFloat, onLayer layer: CGFloat) {
        
        let spacePerLetter = 20
        let totalWidthOfText = t.characters.count * spacePerLetter
        let numberOfRow: Int = (totalWidthOfText / Int(super.size.width)) + 1
        let charactersForRow: Int = t.characters.count / numberOfRow
        var charactersAddedd: Int = 0
        
        var to, from: String.Index
        var label: SKLabelNode
        var positionY = CGFloat((size.height/2) - 160)
        
        repeat{
            
            label = SKLabelNode(fontNamed: "Chalkduster")
            label.fontSize = fSize
            label.name = name
            label.zPosition = layer
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
            positionY.add(CGFloat(-fSize))
            
        }while charactersAddedd < t.characters.count
    }
}
