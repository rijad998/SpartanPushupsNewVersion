//
//  DataHandler.swift
//  SpartanPushupsNewVersion
//
//  Created by Rijad Babovic on 25/06/2019.
//  Copyright © 2019 Rijad Babovic. All rights reserved.
//

import Foundation

class DataHandler {
    
    static var listLevels: [Level]!
    fileprivate static var activeLevelIndex: Int = 0
    fileprivate static var activeSeriesIndex: Int = 0
    fileprivate static var activeRoundIndex: Int = 0
    static var limitPerLevel = 10
    
    /// Changing active round to the next one
    static func markNextRoundAnActive() {
        if activeRoundIndex >= roundsLimit - 1 {
            activeRoundIndex = 0
            if activeSeriesIndex >= limitPerLevel - 1 {
                activeSeriesIndex = 0
                if activeLevelIndex >= listLevels.count - 1 {
                    // WORKOUT OVER
                } else {
                    activeLevelIndex += 1
                }
            } else {
                activeSeriesIndex += 1
            }
        } else {
            activeRoundIndex += 1
        }
    }
    
    /// Getter that returns active round
    static var activeRound: Round {
        get {
            return activeSeries.rounds[activeRoundIndex]
        }
    }
    
    /// Getter that returns active series
    static var activeSeries: Series {
        get {
            // return isAppActiveConfig.isAppActive ? listLevels[activeLevelIndex].series[activeSeriesIndex] : getEmptySeries()
            return generateStartingSeries()
        }
    }
    
    /// Function that returns active level
    static func getActiveLevel() -> Level? {
        
        if let level = getLevelByIndex(levelIndex: activeLevelIndex) {
            return level
        }
        return nil
    }
    
    /// Function that creates empty series
    fileprivate static func getEmptySeries() -> Series {
        let series = Series(onIndex: 0)
        //for (index, _) in (series.rounds).enumerated() {
        for index in 0...4 {
            let roundZ = Round(reps: 0, rest: nil, onIndex: index)
            series.rounds.append(roundZ)
        }
        return series
    }
    
    /// Function that calculates progress inside one level
    static func getProgress() -> Int {
        let activeLevel = listLevels[activeLevelIndex]
        let finishedSeries = activeLevel.series.filter{$0.state == .finished}.count
        return Int(( 100 / activeLevel.series.count ) * finishedSeries)
    }
    
    /// Function that generates signle series
    fileprivate static func generateStartingSeries() -> Series {
        let seriess = Series(onIndex: 0)
        for j in 0 ... roundsLimit - 1 {
            let reps = Int.random(in: 3...4)
            var rest: Int?
            if j != 0 {
                rest = 11
            }
            let round = Round(reps: reps, rest: rest, onIndex: j)
            seriess.rounds.append(round)
        }
        return seriess
    }
    
    /// Function that generates whole level of series
    fileprivate static func generateLevelSeries(limitPerLevel: Int, startingSeries: Series) {
        for i in 1 ... limitPerLevel - 1 {
            
            let newSeries = Series(onIndex: i)
        
            for j in 0 ... roundsLimit - 1 {
                var reps = startingSeries.rounds[j].reps
                reps += i
                var rest: Int?
                if j != 0 {
                    rest = 11
                }
                let round = Round(reps: reps, rest: rest, onIndex: j)
                newSeries.rounds.append(round)
            }
        }
    }
    
    
//    fileprivate static func generateLevels() {
//        for (index, name) in (levelNames.names).enumerated() {
//            let lev = Level(onIndex: index, name: name)
//            /// proziva funkciju koja mu vraca prvu seriju
//            lev.series.append(getSeries)
//            /// proziva algoritam koji kreira ostale serije
//            /// --- ALGORITAM ---
//            listLevels.append(lev)
//        }
//    }
    
    
//    fileprivate static var getSeries: Series {
//        get {
//            /// Ovdje ide index nula jer ovo predstavlja prvu seriju u nizu
//            /// Ta serija je pocetna serija nad kojom radi algoritam koji
//            /// kasnije pravi ostale serije za taj level
//            let series = Series(onIndex: 0)
//            for index in 0 ... roundsLimit - 1 {
//                let randomNum = Int.random(in: 3 ... 6)
//                var rest: Int?
//                if index != 0 {
//                    rest = 11
//                }
//                let round = Round(reps: randomNum, rest: rest, onIndex: index)
//                series.rounds.append(round)
//            }
//            return series
//        }
//    }
    
    /// Returns level by provided index
    static func getLevelByIndex(levelIndex: Int) -> Level? {
        //return levelIndex < listLevels.count : listLevels[levelIndex] ?? nil
        if listLevels.count > levelIndex  {
            return listLevels[levelIndex]
        }
        return nil
    }
    
    /// Returns series by provided index
    static func getSeriesByIndex(levelIndex: Int, seriesIndex: Int) -> Series? {
        if let level = getLevelByIndex(levelIndex: levelIndex) {
            if level.series.count > seriesIndex {
                return level.series[seriesIndex]
            }
        }
        return nil
    }
    
    /// Returns round by provided index
    static func getRoundByIndex(levelIndex: Int, seriesIndex: Int, roundIndex: Int) -> Round? {
        if let series = getSeriesByIndex(levelIndex: levelIndex, seriesIndex: seriesIndex) {
            if series.rounds.count > roundIndex {
                return series.rounds[roundIndex]
            }
        }
        return nil
    }
}

/// Class for singel level
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

/// Class for single series
class Series {
    
    var rounds: [Round] = []
    var onIndex: Int
    var state: ActiveSeries = .next
    
    init(onIndex: Int) {
        self.onIndex = onIndex
    }
}

/// Class for single round
class Round {
    
    var reps: Int
    var rest: Int?
    var current: Int
    var onIndex: Int
    var state: ActiveRound = .inactive
    
    init(reps: Int, rest: Int?, onIndex: Int) {
        self.reps = reps
        self.rest = rest
        self.current = reps
        self.onIndex = onIndex
    }
}
