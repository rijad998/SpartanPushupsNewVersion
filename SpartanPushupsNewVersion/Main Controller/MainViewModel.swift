//
//  MainViewModel.swift
//  SpartanPushupsNewVersion
//
//  Created by Rijad Babovic on 26/06/2019.
//  Copyright © 2019 Rijad Babovic. All rights reserved.
//

import Foundation
import UIKit

protocol MainViewModelDelegate {
    func returnActiveSeries(series: Series)
}

class MainViewModel {
    
    var delegate: MainViewModelDelegate?
    var currentProgress: Int!
    var model = DataHandler.activeSeries
    
    init() {}
    
    func getProgress() {
        self.currentProgress = DataHandler.getProgress()
    }
    
    func getActiveLevel() {
        delegate?.returnActiveSeries(series: model)
    }
}
