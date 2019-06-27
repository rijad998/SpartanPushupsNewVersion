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
    func returnLevel(level: Level)
}

class MainViewModel {
    
    var delegate: MainViewModelDelegate?
    
    init() {}
    
    func getLevel() {
        if let level = DataHandler.getActiveLevel() {
            delegate?.returnLevel(level: level)
        }
    }
}
