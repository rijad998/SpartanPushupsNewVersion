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
    
    
    fileprivate var viewModel: RoundSeriesViewModel!
    
    init(series: Series) {
        viewModel = RoundSeriesViewModel(series: series)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
