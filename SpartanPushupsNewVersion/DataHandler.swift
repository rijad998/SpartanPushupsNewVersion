//
//  DataHandler.swift
//  SpartanPushupsNewVersion
//
//  Created by Rijad Babovic on 25/06/2019.
//  Copyright © 2019 Rijad Babovic. All rights reserved.
//

import Foundation

public class DataHandler {
    
    fileprivate var activeSeries: [Int] = []
    public var getSeries: [Int] {
        get {
            if activeSeries.isEmpty {
                generateSeries()
            }
            return activeSeries
        }
    }
    
    public func generateSeries(){
        self.cleanActiveSeries()
        for _ in 1...limit {
            let randomNum = Int.random(in: 3 ... 6)
            activeSeries.append(randomNum)
        }
    }
    
    public func cleanActiveSeries(){
        activeSeries.removeAll()
    }
    
}
