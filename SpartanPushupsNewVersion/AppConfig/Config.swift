//
//  Config.swift
//  SpartanPushUps
//
//  Created by Rijad Babovic on 03/06/2019.
//  Copyright © 2019 Rijad Babovic. All rights reserved.
//

import Foundation
import UIKit

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

public var nodesLimit = 5

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
