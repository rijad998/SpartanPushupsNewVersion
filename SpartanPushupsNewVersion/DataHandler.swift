//
//  DataHandler.swift
//  SpartanPushupsNewVersion
//
//  Created by Rijad Babovic on 25/06/2019.
//  Copyright © 2019 Rijad Babovic. All rights reserved.
//

import Foundation

class DataHandler {
    
    fileprivate static var levels:[Level]!
    static var activeIndex: Int?
    
    static func getActiveLevel() -> Level {
        if levels == nil {
            generateLevels()
        }
        if let index = activeIndex {
            return levels[index]
        } else {
            return
        }
        
    }
    
    
    fileprivate static var getSerie: Seria {
        get {
            let series = Seria()
            for index in 1...nodesLimit {
                let randomNum = Int.random(in: 3 ... 6)
                var rest: Int?
                if index != 0 {
                    rest = 11
                }
                let exer = Exercise(pushUps: randomNum, rest: rest, current: nil, onIndex: index - 1)
                series.exercises.append(exer)
            }
            return series
        }
    }
    
    
    fileprivate static func generateLevels() {
        for (index, name) in (levelNames.names).enumerated() {
            let lev = Level(name: name, seria: getSerie, index: index)
            levels.append(lev)
        }
    }
}


class Exercise {
    
    var pushUps: Int
    var rest: Int?
    var current: Int
    var onIndex: Int
    var state: ActiveNode = .inactive
    
    init(pushUps: Int, rest: Int?, current: Int?, onIndex: Int) {
        self.pushUps = pushUps
        self.rest = rest
        if let current = current {
            self.current = current
        } else {
            self.current = pushUps
        }
        self.onIndex = onIndex
    }
}


class Seria {
    
    var id = 0
    // var onIndex = 0
    var exercises: [Exercise] = []
}


class Level {
    
    var name: String
    var seria: [Seria] = []
    var onIndex: Int
    var state: Select = .none
    
    init (name: String, seria: [Seria], index: Int){
        self.name = name
        self.seria = seria
        self.onIndex = index
    }
}
