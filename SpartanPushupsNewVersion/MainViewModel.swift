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
    func returnLevel(series: Series)
}

class MainViewModel {
    
    var delegate: MainViewModelDelegate?
    var currentProgress: Int
    
    init() {}
    
    func getProgress() {
        currentProgress = DataHandler.getProgress()
    }
    
    func getActiveSeries() {
        
        let activeSeries = DataHandler.listLevels[DataHandler.activeLevelIndex].series[DataHandler.activeSeriesIndex]
        delegate?.returnLevel(series: activeSeries)
    }
}
