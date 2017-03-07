//
//  Language.swift
//  DiscoveryChallenge
//
//  Created by Alberto Volpe on 06/03/2017.
//  Copyright © 2017 Alberto Volpe. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class Language{
    
    private let TAG = "Language"
    static private var language = "en-EN"
    
    init() { }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func change() -> String {
    
        switch Language.language{
        case "en-EN":
            Language.language = "it-IT"
            return "Italian"
        default:
            Language.language = "en-EN"
            return "English"
        }
    }
    
    static func getLanguage() -> String{
        return Language.language
    }
}
