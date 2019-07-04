//
//  Config.swift
//  SpartanPushUps
//
//  Created by Rijad Babovic on 03/06/2019.
//  Copyright © 2019 Rijad Babovic. All rights reserved.
//

import Foundation
import UIKit

public var roundsLimit = 5

public struct roundCircleSize {
    
    static var diameter: CGFloat = 40
    static var radius: CGFloat = (diameter/2)
}

public var workSectionDiameter: CGFloat = 260

public var bgImg: UIImage {
    
    get {
        return UIImage(named: "bg.png")!
    }
}

public struct Font {
    
    static let roboto = "Roboto-Regular"
    static let exoBoldItalic = "Exo-BoldItalic"
    static let exoSemiBoldItalic = "Exo-SemiBoldItalic"
    static let exoItalic = "Exo-Italic"
}

public struct LabelFont {
    static let regular = UIFont(name: Font.exoBoldItalic, size: 60)
    static let start = UIFont(name: Font.exoBoldItalic, size: 35)
}

public struct Tabs {
    
    static let numberOfLevels = 4
    static let numberOfPushupTypes = 2
}

public struct levelNames {
    
    static let names = ["Novice", "Beginner", "Intermediate", "Spartan"]
}

public struct pushups {
    
    static let names = ["Pushups", "Spartan Pushups"]
}

public struct isAppActiveConfig {
    
    static var isAppActive: Bool {
        return UserDefaults.standard.bool(forKey: "is_app_active")
    }
    
    static func activateApp() {
        setupAppActivation(isActive: true)
    }
    
    static func deactivateApp() {
        setupAppActivation(isActive: false)
    }
    
    fileprivate static func setupAppActivation(isActive: Bool) {
        UserDefaults.standard.set(isActive, forKey: "is_app_active")
        UserDefaults.standard.synchronize()
    }
}
