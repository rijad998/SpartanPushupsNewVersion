//
//  DataHandler.swift
//  SpartanPushupsNewVersion
//
//  Created by Rijad Babovic on 25/06/2019.
//  Copyright © 2019 Rijad Babovic. All rights reserved.
//

import Foundation

class DataHandler {
    
    fileprivate static var serie: Seria!
    fileprivate static var levels: [Level] = []
    
    static func getLevel(index: Int) -> Level {
        return levels[index]
    }
    
    static var getSerie: Seria {
        get {
            if serie == nil {
                generateSeries()
            }
            return serie
        }
    }
    
    
    static func generateSeries(){
        let serie = Seria()
        for index in 1...nodesLimit {
            let randomNum = Int.random(in: 3 ... 6)
            var rest: Int?
            if index != 0 {
                rest = 11
            }
            let exer = Exercise(pushUps: randomNum, rest: rest, current: nil, onIndex: index - 1)
            serie.exercises.append(exer)
        }
    }
}


class Exercise {
    
    var pushUps:Int
    var rest: Int?
    var current: Int
    
    init(pushUps: Int, rest: Int?, current: Int?, onIndex: Int) {
        self.pushUps = pushUps
        self.rest = rest
        if let current = current {
            self.current = current
        } else {
            self.current = pushUps
        }
    }
}


class Seria {
    
    var id = 0
    // var onIndex = 0
    var exercises: [Exercise] = []
}


class Level {
    
    var name: String
    var seria: Seria
    var onIndex: Int
    
    init (name: String, seria: Seria, index: Int){
        self.name = name
        self.seria = seria
        self.onIndex = index
    }
}
