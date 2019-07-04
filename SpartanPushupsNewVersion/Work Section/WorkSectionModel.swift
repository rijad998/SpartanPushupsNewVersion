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
    
    func getLabelRestText() {
        if let rest = model.rest {
            restTimer.fireTimer(restTime: rest)
        } else {
            getLabelPushups()
        }
    }
    
    func getLabelPushups() {
        if model.current >= 0 {
            model.current -= 1
            delegate?.getModelRep(reps: model.current)
            if model.current == 0 {
                AsyncUtility.delay(0.5) {
                    DataHandler.markNextRoundAnActive()
                    self.reload()
                    self.getLabelRestText()
                }
                self.model.state = .activeDone
                model.current = model.reps
            }
        }
    }
    
    func reload() {
        model = DataHandler.activeRound
        
    }
}
