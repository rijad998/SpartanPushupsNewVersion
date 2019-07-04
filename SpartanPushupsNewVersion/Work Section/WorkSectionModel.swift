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
    func reloadView()
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
            doPushups()
        }
    }
    
    func doPushups() {
        if model.current >= 0 {
            model.current -= 1
            delegate?.getModelRep(reps: model.current)
            if model.current == 0 {
                if model.onIndex == 4 {
                    // OPEN THIRD VIEW
                    AsyncUtility.delay(0.5) {
                        
                    }
                } else {
                    self.model.state = .activeDone
                    model.current = model.reps
                    DataHandler.markNextRoundAnActive()
                    AsyncUtility.delay(0.5) {
                        self.reload()
                        self.getLabelRestText()
                    }
                }
            }
        }
    }
    
    func reload() {
        model = DataHandler.activeRound
        delegate?.reloadView()
    }
}
