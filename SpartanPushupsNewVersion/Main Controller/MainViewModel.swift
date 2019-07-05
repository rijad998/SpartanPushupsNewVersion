//
//  MainViewModel.swift
//  SpartanPushupsNewVersion
//
//  Created by Rijad Babovic on 26/06/2019.
//  Copyright © 2019 Rijad Babovic. All rights reserved.
//

import Foundation
import UIKit

/// Main delegate of main view model
protocol MainViewModelDelegate {
    func returnActiveSeries(series: Series)
}

/// Main view model of main controller
/// Currently in charge of gettign progress and
/// parsing active series to the main controller
class MainViewModel {
    
    var delegate: MainViewModelDelegate?
    var currentProgress: Int!
    var model = DataHandler.activeSeries
    
    init() {}
    
    /// Returns progress to the main controller
    func getProgress() {
        self.currentProgress = DataHandler.getProgress()
    }
    
    /// Returns active level to the main controller
    func getActiveLevel() {
        delegate?.returnActiveSeries(series: model)
    }
}
