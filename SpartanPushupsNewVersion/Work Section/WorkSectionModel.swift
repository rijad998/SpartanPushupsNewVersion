//
//  WorkSectionModel.swift
//  SpartanPushupsNewVersion
//
//  Created by Rijad Babovic on 03/07/2019.
//  Copyright © 2019 Rijad Babovic. All rights reserved.
//

import Foundation

/// View Model delegate
protocol WorkSectionModelDelegate {
    func getModelRep(reps: Int)
    func reloadView()
    func changeFont()
}

/// View model for section which interacts with user
/// It gets all data and passes it to the round circle view
class WorkSectionModel {
    
    var delegate: WorkSectionModelDelegate!
    var model = DataHandler.activeRound
    var restTimer = RestTimer()
    
    init() {}
    
    /// Function for calling timer and writing it on the circle view
    func getLabelRestText() {
        if let rest = model.rest {
            delegate?.changeFont()
            restTimer.fireTimer(restTime: rest)
        } else {
            doPushups()
        }
    }
    
    /// Main function for pushups. It decreases number of pushups,
    /// Check for rounds, series, invokes new series etc.
    func doPushups() {
        if model.current >= 0 {
            model.current -= 1
            delegate?.getModelRep(reps: model.current)
            if model.current == 0 {
                if model.onIndex == 4 {
                    // OPEN THIRD VIEW
                    AsyncUtility.delay(0.5) {
                        print ("Kraj serije")
                    }
                } else {
                    self.model.state = .activeDone
                    model.current = model.reps
                    DataHandler.markNextRoundAnActive()
                    AsyncUtility.delay(0.5) {
                        self.getLabelRestText()
                    }
                    reload()
                }
            }
        }
    }
    
    /// Function for reloading views
    func reload() {
        model = DataHandler.activeRound
        delegate?.reloadView()
    }
}
