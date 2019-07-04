//
//  WorkSectionModel.swift
//  SpartanPushupsNewVersion
//
//  Created by Rijad Babovic on 03/07/2019.
//  Copyright © 2019 Rijad Babovic. All rights reserved.
//

import Foundation

protocol WorkSectionModelDelegate {
    func getModelRep(reps: Int)
}

class WorkSectionModel {
    
    var delegate: WorkSectionModelDelegate!
    var model = DataHandler.activeRound
    var restTimer = RestTimer()
    
    init() {}
    
    func getLabelText() {
        if let rest = model.rest {
            restTimer.fireTimer(restTime: rest)
        }
        
    }
    
    func getNextSeries() {
        
    }
}
