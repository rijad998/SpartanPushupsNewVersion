//
//  DataHandler.swift
//  SpartanPushupsNewVersion
//
//  Created by Rijad Babovic on 25/06/2019.
//  Copyright © 2019 Rijad Babovic. All rights reserved.
//

import Foundation

class DataHandler {
    
    fileprivate static var listLevels: [Level]!
//    static var activeIndex: Int?
    
//    static func getActiveLevel() -> Level {
//        if levels == nil {
//            generateLevels()
//        }
//        if let index = activeIndex {
//            return levels[index]
//        } else {
//            return
//        }
//    }
    
    
    fileprivate static func generateLevels() {
        for (index, name) in (levelNames.names).enumerated() {
            let lev = Level(onIndex: index, name: name)
            /// proziva funkciju koja mu vraca prvu seriju
            lev.series.append(getSeries)
            /// proziva algoritam koji kreira ostale serije
            /// --- ALGORITAM ---
            listLevels.append(lev)
        }
    }
    
    
    fileprivate static var getSeries: Series {
        get {
            /// Ovdje ide index nula jer ovo predstavlja prvu seriju u nizu
            /// Ta serija je pocetna serija nad kojom radi algoritam koji
            /// kasnije pravi ostale serije za taj level
            let series = Series(onIndex: 0)
            for index in 0 ... nodesLimit - 1 {
                let randomNum = Int.random(in: 3 ... 6)
                var rest: Int?
                if index != 0 {
                    rest = 11
                }
                let round = Round(reps: randomNum, rest: rest, current: nil, onIndex: index)
                series.rounds.append(round)
            }
            return series
        }
    }
    

    static func getLevelByIndex(levelIndex: Int) -> Level? {
        if !(listLevels.count > levelIndex)  {
            return nil
        }
        return listLevels[levelIndex]
    }
    
    
    static func getSeriesByIndex(levelIndex: Int, seriesIndex: Int) -> Series? {
        if let level = getLevelByIndex(levelIndex: levelIndex) {
            if !(level.series.count > seriesIndex) {
                return nil
            }
            return level.series[seriesIndex]
        }
        return nil
    }
    
    
    static func getRoundByIndex(levelIndex: Int, seriesIndex: Int, roundIndex: Int) -> Round? {
        if let series = getSeriesByIndex(levelIndex: levelIndex, seriesIndex: seriesIndex) {
            if !(series.rounds.count > roundIndex) {
                return nil
            }
            return series.rounds[roundIndex]
        }
        return nil
    }
}

class Level {
    
    var series: [Series] = []
    var onIndex: Int
    var name: String
    var state: Select = .none
    
    init(onIndex: Int, name: String) {
        self.onIndex = onIndex
        self.name = name
    }
}

class Series {
    
    var rounds: [Round] = []
    var onIndex: Int
    var state: Select = .none
    
    init(onIndex: Int) {
        self.onIndex = onIndex
    }
}

class Round {
    
    var reps: Int
    var rest: Int?
    var current: Int?
    var onIndex: Int
    var state: ActiveNode = .inactive
    
    init(reps: Int, rest: Int?, current: Int?, onIndex: Int) {
        self.reps = reps
        self.rest = rest
        if let current = current {
            self.current = current
        } else {
            self.current = reps
        }
        self.onIndex = onIndex
    }
}


