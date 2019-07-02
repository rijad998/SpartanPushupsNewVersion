//
//  RoundSeriesView.swift
//  SpartanPushupsNewVersion
//
//  Created by Rijad Babovic on 28/06/2019.
//  Copyright © 2019 Rijad Babovic. All rights reserved.
//

import Foundation
import UIKit

class RoundSeriesView: UIView {
    
    var roundSeriesList: [SeriaItem] = []
    var roundSeriesSubView = UIView(frame: CGRect.zero)
    
    init() {
        super.init(frame: CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    func setup() {
        
        for (index, item) in DataHandler.activeSeries.rounds.enumerated() {
            var roundItem = SeriaItem(round: item)
            roundSeriesList.append(roundItem)
            addSubview(roundItem)
        }
    }
    
    func layout() {
        
    }
    
}

class SeriaItem: UIView {
    
    fileprivate var roundCircle = UIView()
    fileprivate var horizontalLine = UIView()
    fileprivate var pushupLabel = UILabel()
    fileprivate var model: Round!
    
    init(round: Round){
        self.model = round
        super.init(frame: CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    func layout() {
        <#code#>
    }
    
    func setup() {
        
    }
    
    func reload() {
        pushupLabel.text = "\(model.reps)"
        setRoundsByState()
    }
    
    /// Function that defines differences between states
    /// of nodes and set item according to the given node
    ///
    /// - Parameter state: state that item needs to get
    func setRoundsByState() {
        switch model.state {
        case .activeDone:
            roundCircle.backgroundColor = #colorLiteral(red: 0.8352941176, green: 0, blue: 0, alpha: 1)
            roundCircle.layer.borderColor = #colorLiteral(red: 0.8352941176, green: 0, blue: 0, alpha: 1)
            horizontalLine.backgroundColor = #colorLiteral(red: 0.8352941176, green: 0, blue: 0, alpha: 1)
            setShadow()
        case .activeNext:
            roundCircle.backgroundColor = #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1)
            roundCircle.layer.borderColor = #colorLiteral(red: 0.8352941176, green: 0, blue: 0, alpha: 1)
            horizontalLine.backgroundColor = #colorLiteral(red: 0.8352941176, green: 0, blue: 0, alpha: 1)
            setShadow()
        default:
            roundCircle.backgroundColor = #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 0.54)
            roundCircle.layer.borderColor = #colorLiteral(red: 0.8352941176, green: 0, blue: 0, alpha: 0.54)
            horizontalLine.backgroundColor = #colorLiteral(red: 0.8352941176, green: 0, blue: 0, alpha: 0.5388484589)
            roundCircle.layer.shadowOpacity = 0
        }
    }
    
    /// Function that defines and set shadow under nodes
    func setShadow() {
        roundCircle.layer.shadowPath = UIBezierPath(roundedRect: .init(x: 0, y: 7, width: 38, height: 38), cornerRadius: 18).cgPath
        roundCircle.layer.shadowColor = #colorLiteral(red: 0.8352941176, green: 0, blue: 0, alpha: 1)
        roundCircle.layer.shadowOpacity = 1
        roundCircle.layer.shouldRasterize = true
    }
}
