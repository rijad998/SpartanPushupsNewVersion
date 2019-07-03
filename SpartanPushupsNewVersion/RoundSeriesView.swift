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
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    func setup() {
        
        addSubview(roundSeriesSubView)
        roundSeriesSubView.frame.size.width = 0
        for (index, item) in DataHandler.activeSeries.rounds.enumerated() {
            let w: CGFloat = index >= (DataHandler.activeSeries.rounds.count - 1) ? 40 : 60
            let roundItem = SeriaItem(round: item, frame: CGRect(x: 0, y: 0, width: w, height: 40))
            roundSeriesList.append(roundItem)
            roundSeriesSubView.addSubview(roundItem)
            roundSeriesSubView.frame.size.width += w
        }
        roundSeriesSubView.frame.size.height = 40
    }
    
    func layout() {
        roundSeriesSubView.onCenter(roundSeriesSubView.width, roundSeriesSubView.height)
        var xOffset: CGFloat = 0
        for item in roundSeriesList {
            item.onSide(.left, xOffset, width: item.width, height: item.height)
            xOffset += item.width
        }
    }
    
}

class SeriaItem: UIView {
    
    fileprivate var roundCircle = UIView()
    fileprivate var horizontalLine = UIView()
    fileprivate var pushUpLabel = UILabel()
    fileprivate var model: Round!
    
    init(round: Round, frame: CGRect){
        self.model = round
        super.init(frame: frame)
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
        roundCircle.onSide(.left, 0, width: 40, height: 40)
        if !horizontalLine.isHidden {
            horizontalLine.onSide(.right, 0, width: 20, height: 3)
        }
        pushUpLabel.fillSuperView()
    }
    
    func setup() {
        addSubview(horizontalLine)
        horizontalLine.isHidden = !(frame.width > 40)
        addSubview(roundCircle)
        roundCircle.layer.cornerRadius = 20
        roundCircle.layer.borderWidth = 2
        roundCircle.addSubview(pushUpLabel)
        pushUpLabel.font = UIFont(name: Font.exoBoldItalic, size: 18)
        pushUpLabel.textAlignment = .center
        pushUpLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        reload()
    }
    
    func reload() {
        pushUpLabel.text = "\(0)" == "\(model.reps)" ? "\(model.reps)" : ""
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
        roundCircle.layer.shadowPath = UIBezierPath(roundedRect: .init(x: 0, y: 7, width: roundCircleSize.diameter, height: roundCircleSize.diameter), cornerRadius: roundCircleSize.radius).cgPath
        roundCircle.layer.shadowColor = #colorLiteral(red: 0.8352941176, green: 0, blue: 0, alpha: 1)
        roundCircle.layer.shadowOpacity = 1
        roundCircle.layer.shouldRasterize = true
    }
}
