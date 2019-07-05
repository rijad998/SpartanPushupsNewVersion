//
//  WorkSectionView.swift
//  SpartanPushupsNewVersion
//
//  Created by Rijad Babovic on 03/07/2019.
//  Copyright © 2019 Rijad Babovic. All rights reserved.
//

import Foundation
import UIKit

protocol WorkSectionViewDelegate {
     func reload()
}

/// Main section which interacts with user with view and
/// all needed components
class WorkSectionView: UIView {
    
    fileprivate let bgImgView = UIImageView(image: UIImage(named: "bg-circle.png"))
    fileprivate let repsTimeLbl = UILabel()
    fileprivate var viewModel = WorkSectionModel()
    var delegate: WorkSectionViewDelegate!
    var checkStart: Bool = true
    
    init(circleDiameter: CGFloat) {
        
        super.init(frame: CGRect(x: 0, y: 0, width: circleDiameter, height: circleDiameter))
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Overriding layoutSubviews function with my
    /// own layout
    override func layoutSubviews() {
        
        super.layoutSubviews()
        layout()
    }
    
    /// Custom layout
    func layout() {
        
        self.layer.cornerRadius = (self.width / 2)
        bgImgView.fillSuperView()
        repsTimeLbl.fillSuperView()
    }
    
    /// Main setup function, sets up main label, image,
    /// UITapRecognizer etc.
    func setup() {
        
        addSubview(bgImgView)
        bgImgView.addSubview(repsTimeLbl)
        bgImgView.isUserInteractionEnabled = true
        viewModel.restTimer.delegate = self
        repsTimeLbl.font = LabelFont.regular
        repsTimeLbl.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        repsTimeLbl.textAlignment = .center
        repsTimeLbl.numberOfLines = 0
        repsTimeLbl.text = "Test text"
        let noseTap = UITapGestureRecognizer(target: self, action: #selector(handleNoseTap(_:)))
        repsTimeLbl.addGestureRecognizer(noseTap)
        repsTimeLbl.isUserInteractionEnabled = true
        //if !isAppActiveConfig.isAppActive {repsTimeLbl.isUserInteractionEnabled = false}
        
    }
    
    /// Function that handles tap on the circle
    @objc func handleNoseTap(_ sender: UITapGestureRecognizer? = nil) {
        print("slgsjfhlflsflfs------------------------------------")
        checkStart ? tapToStart() : viewModel.getLabelRestText()
    }
    
    /// Function that writes "Tap to Start" on the circle
    func tapToStart() {
        repsTimeLbl.font = LabelFont.start
        repsTimeLbl.numberOfLines = 2
        repsTimeLbl.text = "TAP TO\nSTART"
        checkStart = false
    }
    
}

/// Implementation of view models delegate
extension WorkSectionView: WorkSectionModelDelegate {
    
    func reloadView() {
        delegate?.reload()
    }
    
    func changeFont() {
        repsTimeLbl.font = LabelFont.regular
    }
    
    func getModelRep(reps: Int) {
        repsTimeLbl.text = "\(reps)"
    }

}

/// Implementation of rest timrs delegate
extension WorkSectionView: RestTimerDelegate {
    
    /// Function that writis time on the label
    func getTimerRest(currentTime: Int) {
        repsTimeLbl.isUserInteractionEnabled = false
        repsTimeLbl.text = "\(currentTime)"
        if currentTime == 0 {
            AsyncUtility.delay(0.5){
                self.viewModel.doPushups()
                self.repsTimeLbl.isUserInteractionEnabled = true
            }
        }
    }
}


