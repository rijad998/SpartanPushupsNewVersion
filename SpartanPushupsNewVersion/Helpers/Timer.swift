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
    func returnTime(currentTime: Int)
}

class RestTimer {
    
    fileprivate var restTime: Int
    fileprivate var restartTime: Int
    fileprivate var timer = Timer()
    var delegate: RestTimerDelegate?
    fileprivate var isRunning = false
    
    init(restTime: Int) {
        self.restTime = restTime
        self.restartTime = restTime
    }
    
    func fireTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        timer.fire()
        isRunning = true
    }
    
    
    @objc func timerAction() {
        delegate?.returnTime(currentTime: restTime)
        if restTime == 0 {
            timerInvalidate()
        }
        restTime -= 1
    }
    
    func timerInvalidate() {
        isRunning = false
        timer.invalidate()
    }
    
    func timerRestart() {
        restTime = restartTime
        fireTimer()
    }
    
}
