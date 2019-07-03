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
    fileprivate var noseTap = UITapGestureRecognizer()
    
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
        repsTimeLbl.font = UIFont(name: Font.exoBoldItalic, size: 60)
        repsTimeLbl.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        repsTimeLbl.textAlignment = .center
        repsTimeLbl.numberOfLines = 0
        repsTimeLbl.text = "Test text"
        
    }
}
