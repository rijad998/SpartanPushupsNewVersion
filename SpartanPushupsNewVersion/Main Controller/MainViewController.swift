//
//  ViewController.swift
//  SpartanPushupsNewVersion
//
//  Created by Rijad Babovic on 25/06/2019.
//  Copyright © 2019 Rijad Babovic. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    fileprivate let mainViewModel = MainViewModel()
    fileprivate var roundSeriesView: RoundSeriesView = RoundSeriesView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.contents = UIImage.loadImageData("bg.png")?.cgImage
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // layout()
        roundSeriesView.onSide(.top, 200, width: view.bounds.width, height: 64)
    }
    
    func setup() {
        mainViewModel.delegate = self
        view.addSubview(roundSeriesView)
    }
}

extension MainViewController: MainViewModelDelegate {
    
    func returnLevel(series: Series) {
        //roundSeriesView = RoundSeriesView(series: series)
    }
}

