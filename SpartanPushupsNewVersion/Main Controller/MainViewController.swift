//
//  ViewController.swift
//  SpartanPushupsNewVersion
//
//  Created by Rijad Babovic on 25/06/2019.
//  Copyright © 2019 Rijad Babovic. All rights reserved.
//

import UIKit

/// Main View Controller
class MainViewController: UIViewController {

    fileprivate let mainViewModel = MainViewModel()
    fileprivate var roundSeriesView: RoundSeriesView = RoundSeriesView()
    fileprivate var workSection: WorkSectionView = WorkSectionView(circleDiameter: workSectionDiameter)
    
    /// First function that gets called after loading, it
    /// sets background image and calles setup function
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
        roundSeriesView.onSide(.top, 150, width: view.bounds.width, height: 64)
        workSection.onSide(.top, 300, width: workSection.width, height: workSection.height)
    }
    
    /// Main setup function
    func setup() {
        mainViewModel.delegate = self
        workSection.delegate = self
        view.addSubview(roundSeriesView)
        view.addSubview(workSection)
    }
}

/// Implementation of main view models delegate
extension MainViewController: MainViewModelDelegate {
    
    func returnActiveSeries(series: Series) {
        print("Otvara zadnji view")
    }
}

/// Implementation of work section delegate
extension MainViewController: WorkSectionViewDelegate {
    
    func reload() {
        roundSeriesView.reload()
    }
}
