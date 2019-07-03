//
//  WorkSectionModel.swift
//  SpartanPushupsNewVersion
//
//  Created by Rijad Babovic on 03/07/2019.
//  Copyright © 2019 Rijad Babovic. All rights reserved.
//

import Foundation

protocol WorkSectionModelDelegate {
    func getModel(model: Round)
}

class WorkSectionModel {
    
    var delegate: WorkSectionModelDelegate!
    
    init() {}
    
    func getNextRound() {
        delegate?.getModel(model: DataHandler.activeRounds)
    }
}
