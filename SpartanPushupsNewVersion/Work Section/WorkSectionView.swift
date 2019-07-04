//
//  WorkSectionView.swift
//  SpartanPushupsNewVersion
//
//  Created by Rijad Babovic on 03/07/2019.
//  Copyright © 2019 Rijad Babovic. All rights reserved.
//

import Foundation
import UIKit

class WorkSectionView: UIView {
    
    fileprivate let bgImgView = UIImageView(image: UIImage(named: "bg-circle.png"))
    fileprivate let repsTimeLbl = UILabel()
    fileprivate var viewModel = WorkSectionModel()
    
    init(circleDiameter: CGFloat) {
        
        super.init(frame: CGRect(x: 0, y: 0, width: circleDiameter, height: circleDiameter))
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        layout()
    }
    
    func layout() {
        
        self.layer.cornerRadius = (self.width / 2)
        bgImgView.fillSuperView()
        repsTimeLbl.fillSuperView()
    }
    
    func setup() {
        
        addSubview(bgImgView)
        bgImgView.addSubview(repsTimeLbl)
        viewModel.restTimer.delegate = self
        repsTimeLbl.font = LabelFont.regular
        repsTimeLbl.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        repsTimeLbl.textAlignment = .center
        repsTimeLbl.numberOfLines = 0
        repsTimeLbl.text = "Test text"
        let noseTap = UITapGestureRecognizer(target: self, action: #selector(handleNoseTap(_:)))
        repsTimeLbl.addGestureRecognizer(noseTap)
        if !isAppActiveConfig.isAppActive {repsTimeLbl.isUserInteractionEnabled = false}
        
    }
    
    @objc func handleNoseTap(_ sender: UITapGestureRecognizer? = nil) {
        
    }
    
    func tapToStart() {
        repsTimeLbl.font = LabelFont.start
        repsTimeLbl.numberOfLines = 2
        repsTimeLbl.text = "TAP TO\nSTART"
    }
}

extension WorkSectionView: WorkSectionModelDelegate {
    
    func getModelRep(reps: Int) {
        repsTimeLbl.font = LabelFont.regular
    }

}

extension WorkSectionView: RestTimerDelegate {
    
    func getTimerRest(currentTime: Int) {
        repsTimeLbl.text = "\(currentTime)"
        if currentTime == 0 {
            AsyncUtility.delay(0.5){
                self.viewModel.getLabelPushups()
                self.repsTimeLbl.isUserInteractionEnabled = true
            }
        }
    }
}


