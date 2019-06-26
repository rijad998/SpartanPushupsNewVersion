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
    func returnLevel()
}

class MainViewModel {
    
    var level: Level? = getActiveLevel()
    fileprivate var delegate: MainViewModelDelegate?

}
