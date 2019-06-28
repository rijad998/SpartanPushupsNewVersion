//
//  RoundSeriesViewModel.swift
//  SpartanPushupsNewVersion
//
//  Created by Rijad Babovic on 28/06/2019.
//  Copyright © 2019 Rijad Babovic. All rights reserved.
//

import Foundation

protocol RoundSeriesViewModelDelegate {
    func returnRound(round: Round)
}

class RoundSeriesViewModel {
    
    fileprivate var series: Series
    fileprivate var delegate: RoundSeriesViewModelDelegate?
    
    init(series: Series) {
        self.series = series
    }
}
