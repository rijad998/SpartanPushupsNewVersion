//
//  Timer.swift
//  SpartanPushupsNewVersion
//
//  Created by Rijad Babovic on 27/06/2019.
//  Copyright © 2019 Rijad Babovic. All rights reserved.
//

import Foundation
import UIKit

protocol RestTimerDelegate {
    func getTimerRest(currentTime: Int)
}

class RestTimer {
    
    fileprivate var restTime: Int = 0
    fileprivate var timer = Timer()
    var delegate: RestTimerDelegate?
    fileprivate var isRunning = false
    
    init() {}
    
    func fireTimer(restTime: Int) {
        self.restTime = restTime
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        timer.fire()
        isRunning = true
    }
    
    
    @objc func timerAction() {
        delegate?.getTimerRest(currentTime: restTime)
        if restTime == 0 {
            timerInvalidate()
        }
        restTime -= 1
    }
    
    func timerInvalidate() {
        isRunning = false
        timer.invalidate()
    }
}
